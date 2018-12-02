class CreateAppliances < ActiveRecord::Migration[5.2]
  def change
    create_table :appliances do |t|
      t.string :type
      t.string :model
      t.integer :wattage_label
      t.time :usage_hourspday

      t.timestamps
    end
  end
end
