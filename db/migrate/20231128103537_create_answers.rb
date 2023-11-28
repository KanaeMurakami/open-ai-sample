# frozen_string_literal: true

class CreateAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :answers do |t|
      t.references :result, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
