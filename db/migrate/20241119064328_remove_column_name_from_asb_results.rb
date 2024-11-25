class RemoveColumnNameFromAsbResults < ActiveRecord::Migration[7.2]
  def change
    remove_column :asb_results, :user_id
    remove_column :asb_results, :session_id
  end
end
