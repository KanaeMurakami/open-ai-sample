# frozen_string_literal: true

FactoryBot.define do
  factory :visitor do
    name { 'テスト名前' }
    sex { :unknown }
    birthday { Date.new(2020, 1, 1) }
  end
end
