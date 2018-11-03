class MeterReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :meter_readings do |t|
      t.date :start_date
      t.date :end_date
      t.integer :readings
    end
  end
end
