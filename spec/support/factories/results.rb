# frozen_string_literal: true

FactoryBot.define do
  factory :result do
    visitor
    year { 2024 }
    personality { 'テスト性格' }
    first_half_fortune { 'テスト上半期の運勢' }
    second_half_fortune { 'テスト下半期の運勢' }
  end
end
