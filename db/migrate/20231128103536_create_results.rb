# frozen_string_literal: true

class CreateResults < ActiveRecord::Migration[7.1]
  def change
    create_table :results, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :visitor, null: false, foreign_key: true, index: true, type: :uuid
      t.integer :year, null: false
      t.text :personality, null: false
      t.text :first_half_fortune, null: false
      t.text :second_half_fortune, null: false

      t.timestamps

      t.index %i[visitor_id year], unique: true
    end
  end
end
