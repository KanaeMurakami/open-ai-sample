# frozen_string_literal: true

# 訪問者
class Visitor < ApplicationRecord
  enum :sex, { male: 0, female: 1, unknown: 2 }

  validates :name, presence: true
  validates :sex, presence: true
  validates :birthday, presence: true
end
