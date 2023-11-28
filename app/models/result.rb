# frozen_string_literal: true

# 回答結果
class Result < ApplicationRecord
  belongs_to :visitor

  validates :year, numericality: { only_integer: true }, uniqueness: { scope: :visitor_id }
  validates :personality, presence: true
  validates :first_half_fortune, presence: true
  validates :second_half_fortune, presence: true
end
