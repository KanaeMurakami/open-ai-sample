# frozen_string_literal: true

class CreateOptions < ActiveRecord::Migration[7.1]
  def change
    create_table :options do |t|
      t.references :question, null: false, foreign_key: true, index: true
      t.string :text, null: false
      t.integer :display_order, null: false

      t.timestamps

      t.index %i[question_id text], unique: true
      t.index %i[question_id display_order], unique: true
    end
  end
end
