class UpdateStudentsFields < ActiveRecord::Migration[7.2]
  def change
    change_table :students do |t|
      t.remove :name, :surname # Remove old columns
      t.string :username          # Add new fields
      t.date :date_of_birth
      t.string :home_language
      t.string :lolt           # Language of Learning and Teaching
      t.boolean :attend_grade_one
      t.boolean :repeating_grade_one
    end
  end
end
