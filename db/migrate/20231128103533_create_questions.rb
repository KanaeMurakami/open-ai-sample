# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.integer :display_order, null: false

      t.timestamps

      t.index %i[display_order], unique: true
    end
  end
end
