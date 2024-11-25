class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :name
      t.string :surname
      t.string :login_type
      t.string :role
      t.integer :manager

      t.timestamps
    end
  end
end
