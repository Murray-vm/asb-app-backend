class UpdateUsersFields < ActiveRecord::Migration[7.2]
  def change
    change_table :users do |t|
      t.remove :name, :surname # Remove old fields
      t.integer :age                 # Add new fields
      t.string :gender
      t.integer :yos                 # Years of service (or other meaning)
    end
  end
end
