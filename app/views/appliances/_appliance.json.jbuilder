json.extract! appliance, :id, :type, :model, :wattage_label, :usage_hourspday, :created_at, :updated_at
json.url appliance_url(appliance, format: :json)
