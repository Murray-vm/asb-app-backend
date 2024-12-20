class CreateStudents < ActiveRecord::Migration[7.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :surname
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
