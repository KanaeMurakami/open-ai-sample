# frozen_string_literal: true

# 運勢占いフォーム
class AiFortunetellingForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :sex, :string
  attribute :birthday, :date
  attribute :year, :integer
  attribute :questions
  attr_reader :result_id

  def save # rubocop:disable Metrics/MethodLength
    ApplicationRecord.transaction do
      visitor = Visitor.create!(name:, sex:, birthday:)
      result = Result.create!(
        visitor:,
        year:,
        personality: generate_personality,
        first_half_fortune: generate_first_half_fortune,
        second_half_fortune: generate_second_half_fortune
      )
      @result_id = result.id
      questions.each do |_question_id, value|
        answer = Answer.create!(result:)
        AnswerOption.create!(answer:, option_id: value['option_id'])
      end
    end
  end

  private

  def client
    @client ||= OpenAI::Client.new
  end

  def get_ai_answer(role, question)
    response = client.chat(
      parameters: {
        model: 'gpt-3.5-turbo',
        messages: [{ role: 'system', content: role }, { role: 'user', content: question }],
        temperature: 0.8
      }
    )
    response.dig('choices', 0, 'message', 'content')
  end

  def generate_personality
    role = 'あなたは性格診断師です。'
    question = <<~QUESTION
      下記の特徴を持つ人の、現在の性格を100文字程度で説明してください。回答内容は、多少の突飛な予測を含んで、もっともらしい説明にしてください。
      回答の書き始めは、「あなたの性格は」で始めてください。回答には、読みやすいように適度な改行を入れてください。
      ・生年月日: #{birthday}
      ・性別: #{I18n.t("enum.visitor.sex.#{sex}")}
      ・好きなもの: #{Option.where(id: questions.values.map { |_k, id| id }).pluck(:text).join(', ')}
    QUESTION

    get_ai_answer(role, question)
  end

  def generate_first_half_fortune
    role = 'あなたは少しだけうさんくさい占い師です。'
    question = <<~QUESTION
      下記の特徴を持つ人の、#{year}年の上半期の運勢を占って(予測して)、150文字程度で回答してください。回答内容は、多少の突飛な予測を含んで、もっともらしい説明にしてください。
      回答の書き始めは、「あなたの#{year}年上半期の運勢は」で始めてください。回答には、読みやすいように適度な改行を入れてください。
      ・生年月日: #{birthday}
      ・性別: #{I18n.t("enum.visitor.sex.#{sex}")}
      ・好きなもの: #{Option.where(id: questions.values.map { |_k, id| id }).pluck(:text).join(', ')}
    QUESTION

    get_ai_answer(role, question)
  end

  def generate_second_half_fortune
    role = 'あなたは少しだけうさんくさい占い師です。'
    question = <<~QUESTION
      下記の特徴を持つ人の、#{year}年の下半期の運勢を占って(予測して)、150文字程度で回答してください。回答内容は、多少の突飛な予測を含んで、もっともらしい説明にしてください。
      回答の書き始めは、「あなたの#{year}年下半期の運勢は」で始めてください。回答には、読みやすいように適度な改行を入れてください。
      ・生年月日: #{birthday}
      ・性別: #{I18n.t("enum.visitor.sex.#{sex}")}
      ・好きなもの: #{Option.where(id: questions.values.map { |_k, id| id }).pluck(:text).join(', ')}
    QUESTION

    get_ai_answer(role, question)
  end
end
