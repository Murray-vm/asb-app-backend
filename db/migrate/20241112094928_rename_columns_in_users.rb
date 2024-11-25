class RenameColumnsInUsers < ActiveRecord::Migration[7.2]
  def change
    # Rename columns
    rename_column :users, :password, :password_digest
    rename_column :users, :email, :username

    # Add unique constraint to the username column
    add_index :users, :username, unique: true
  end
end
