class AddBrandAndRatingToAppliance < ActiveRecord::Migration[5.2]
  def change
    add_column :appliances, :brand, :string
    add_column :appliances, :rating, :string
  end
end
