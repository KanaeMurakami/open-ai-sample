# frozen_string_literal: true

# 回答と選択の紐付け
class AnswerOption < ApplicationRecord
  belongs_to :option
  belongs_to :answer

  validates :option, uniqueness: { scope: :answer_id }
end
