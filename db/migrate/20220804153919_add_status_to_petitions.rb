# frozen_string_literal: true

class AddStatusToPetitions < ActiveRecord::Migration[7.0]
  def change
    add_column :petitions, :status, :string
  end
end
