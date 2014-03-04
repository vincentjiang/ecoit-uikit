json.array!(@network_devices) do |network_device|
  json.extract! network_device, :id, :name, :ip, :kind, :place, :position, :sn, :service_expired_day, :function, :remark, :user_id
  json.url network_device_url(network_device, format: :json)
end
