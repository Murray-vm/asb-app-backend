class RenameSessionsToAsbClasses < ActiveRecord::Migration[7.0] # Replace with your Rails version if needed
  def change
    rename_table :sessions, :asb_classes
  end
end
