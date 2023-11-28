# frozen_string_literal: true
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[
  { display_order: 1, options: [{ text: '散歩', display_order: 1 }, { text: '読書', display_order: 2 }] },
  { display_order: 2, options: [{ text: '晴れ', display_order: 1 }, { text: '雨', display_order: 2 }] },
  { display_order: 3, options: [{ text: '甘いもの', display_order: 1 }, { text: '辛いもの', display_order: 2 }] },
  { display_order: 4, options: [{ text: '海外旅行', display_order: 1 }, { text: '近場で旅行', display_order: 2 }] },
  { display_order: 5, options: [{ text: '夜', display_order: 1 }, { text: '朝', display_order: 2 }] },
  { display_order: 6, options: [{ text: '黄色', display_order: 1 }, { text: '水色', display_order: 2 }] },
  { display_order: 7, options: [{ text: 'ランニング', display_order: 1 }, { text: '筋トレ', display_order: 2 }] },
  { display_order: 8, options: [{ text: '冷たい色', display_order: 1 }, { text: '暖かい色', display_order: 2 }] }
].each do |attribute|
  question = Question.create!(display_order: attribute[:display_order])
  attribute[:options].each do |e|
    Option.create!(question:, text: e[:text], display_order: e[:display_order])
  end
end
