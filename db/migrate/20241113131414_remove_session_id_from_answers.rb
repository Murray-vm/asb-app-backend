class RemoveSessionIdFromAnswers < ActiveRecord::Migration[7.2]
  def change
    remove_column :answers, :session_id, :integer
  end
end
