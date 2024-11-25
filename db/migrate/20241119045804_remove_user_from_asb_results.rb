class RemoveUserFromAsbResults < ActiveRecord::Migration[7.2]
  def change
    def change
      remove_reference :asb_results, :user, foreign_key: true
    end
  end
end
