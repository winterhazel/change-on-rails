# frozen_string_literal: true

class CreatePetitions < ActiveRecord::Migration[7.0]
  def change
    create_table :petitions do |t|
      t.string :title
      t.text :description
      t.integer :goal

      t.timestamps
    end
  end
end
