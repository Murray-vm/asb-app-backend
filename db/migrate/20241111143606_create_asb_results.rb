class CreateAsbResults < ActiveRecord::Migration[7.2]
  def change
    create_table :asb_results do |t|
      t.references :session, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.json :result

      t.timestamps
    end
  end
end
