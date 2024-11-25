class CreateAnswers < ActiveRecord::Migration[7.2]
  def change
    create_table :answers do |t|
      t.references :session, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.boolean :correct
      t.json :lines
      t.integer :question

      t.timestamps
    end
  end
end
