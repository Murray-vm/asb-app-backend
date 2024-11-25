class AddMarksToAnswers < ActiveRecord::Migration[7.2]
  def change
    add_column :answers, :marks, :float
  end
end
