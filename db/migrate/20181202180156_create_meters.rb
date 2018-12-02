class CreateMeters < ActiveRecord::Migration[5.2]
  def change
    create_table :meters do |t|
      t.date :start_date
      t.date :end_date
      t.integer :readings

      t.timestamps
    end
  end
end
