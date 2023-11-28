# frozen_string_literal: true

class CreateVisitors < ActiveRecord::Migration[7.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :visitors, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :name, null: false
      t.integer :sex, null: false
      t.date :birthday, null: false

      t.timestamps
    end
  end
end
