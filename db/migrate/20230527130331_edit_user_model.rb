class EditUserModel < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :username, :string, :limit => 25, :null => false, :unique => true
    change_column :users, :email, :string, :limit => 25, :null => false, :unique => true
  end
end
