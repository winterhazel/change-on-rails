class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.text :about_me
      t.string :country
      t.string :twitter_username

      t.timestamps
    end
  end
end
