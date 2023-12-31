# frozen_string_literal: true

# 質問の選択肢
class Option < ApplicationRecord
  belongs_to :question
  has_one :answer_option, dependent: :destroy
  has_one :answer, through: :answer_option

  validates :text, presence: true, uniqueness: { scope: :question_id }
  validates :display_order, numericality: { only_integer: true }, uniqueness: { scope: :question_id }
end
