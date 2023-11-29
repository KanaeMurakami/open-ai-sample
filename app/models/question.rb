# frozen_string_literal: true

# 質問
class Question < ApplicationRecord
  has_many :options, dependent: :destroy

  validates :display_order, numericality: { only_integer: true }, uniqueness: true
end
