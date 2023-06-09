class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :title, null: false
      t.string :description
      t.date :reminder
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end