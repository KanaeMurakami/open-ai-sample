# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    sequence(:display_order) { |n| n }
  end
end
