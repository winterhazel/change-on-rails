# frozen_string_literal: true

class CreateSignatures < ActiveRecord::Migration[7.0]
  def change
    create_table :signatures do |t|
      t.text :message
      t.boolean :private
      t.references :user, null: false, foreign_key: true
      t.references :petition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
