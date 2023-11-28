# frozen_string_literal: true

class CreateAnswerOptions < ActiveRecord::Migration[7.1]
  def change
    create_table :answer_options do |t|
      t.references :option, null: false, foreign_key: true, index: true
      t.references :answer, null: false, foreign_key: true, index: true

      t.timestamps

      t.index %i[option_id answer_id], unique: true
    end
  end
end
