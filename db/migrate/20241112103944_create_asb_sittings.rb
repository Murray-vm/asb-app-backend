class CreateAsbSittings < ActiveRecord::Migration[7.2]
  def change
    create_table :asb_sittings do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :current_section

      t.timestamps
    end
  end
end
