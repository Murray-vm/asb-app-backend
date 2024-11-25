class ChangeSessionToAsbSittingInAnswers < ActiveRecord::Migration[7.2]
  def change
        # Remove the old `session` reference
        # remove_reference :answers, :session, foreign_key: true
        # remove_reference :asb_results, :session, foreign_key: true

        # Add the new `asb_sitting` reference
        add_reference :answers, :asb_sitting, null: false, foreign_key: true
        add_reference :asb_results, :asb_sitting, null: false, foreign_key: true
  end
end
