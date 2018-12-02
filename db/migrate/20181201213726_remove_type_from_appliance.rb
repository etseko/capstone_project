class RemoveTypeFromAppliance < ActiveRecord::Migration[5.2]
  def change
    remove_column :appliances, :type, :string
    add_column :appliances, :category, :string #type is a reserved word
  end
end
