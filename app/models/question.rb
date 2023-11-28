# frozen_string_literal: true

# 質問
class Question < ApplicationRecord
  validates :display_order, numericality: { only_integer: true }, uniqueness: true
end
