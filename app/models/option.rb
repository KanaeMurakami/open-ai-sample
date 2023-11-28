# frozen_string_literal: true

# 質問の選択肢
class Option < ApplicationRecord
  belongs_to :question
end
