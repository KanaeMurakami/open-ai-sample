# frozen_string_literal: true

# 回答
class Answer < ApplicationRecord
  belongs_to :result
  has_one :answer_option, dependent: :destroy
  has_one :option, through: :answer_option
end
