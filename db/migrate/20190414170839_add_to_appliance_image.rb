class AddToApplianceImage < ActiveRecord::Migration[5.2]
  def change
    add_column :appliances, :image, :string
  end
end
