# frozen_string_literal: true

FactoryBot.define do
  factory :option do
    question
    text { 'テスト' }
    sequence(:display_order) { |n| n }
  end
end
