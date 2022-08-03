class AddUserToPetitions < ActiveRecord::Migration[7.0]
  def change
    add_reference :petitions, :user, null: false, foreign_key: true
  end
end
