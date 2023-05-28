class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true, unique: true
      t.string :first_name, nul: false
      t.string :last_name, null: false
      t.string :phone_number, null: false
      t.integer :age, null: false

      t.timestamps
    end
  end
end
