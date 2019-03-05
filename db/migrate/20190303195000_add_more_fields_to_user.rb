class AddMoreFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, :null => true
    add_column :users, :surname, :string, :null => true
    add_column :users, :address, :string, :null => true
  end
end
