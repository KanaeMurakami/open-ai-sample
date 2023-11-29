# frozen_string_literal: true

# 占い結果
class Result < ApplicationRecord
  belongs_to :visitor
  has_many :answers, dependent: :destroy

  validates :year, numericality: { only_integer: true }, uniqueness: { scope: :visitor_id }
  validates :personality, presence: true
  validates :first_half_fortune, presence: true
  validates :second_half_fortune, presence: true
end
