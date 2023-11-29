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
        personality: 'テスト',
        first_half_fortune: 'テスト',
        second_half_fortune: 'テスト'
      )
      @result_id = result.id
      questions.each do |_question_id, value|
        answer = Answer.create!(result:)
        AnswerOption.create!(answer:, option_id: value['option_id'])
      end
    end
  end
end
