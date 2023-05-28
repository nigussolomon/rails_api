class AddDefaults < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :role, :string, :null => false, :default => User::USER_ROLE
    change_column :todos, :status, :string, :null => false, :default => Todo::INCOMPLETE
  end
end
