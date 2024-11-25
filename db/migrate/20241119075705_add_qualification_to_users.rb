class AddQualificationToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :qualification, :text
  end
end
