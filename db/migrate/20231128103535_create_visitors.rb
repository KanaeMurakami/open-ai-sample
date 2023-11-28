# frozen_string_literal: true

class CreateVisitors < ActiveRecord::Migration[7.1]
  def change
    create_table :visitors do |t|
      t.string :name, null: false
      t.integer :sex, null: false
      t.date :birthday, null: false

      t.timestamps
    end
  end
end
