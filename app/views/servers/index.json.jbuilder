json.array!(@servers) do |server|
  json.extract! server, :id, :name, :ip, :ilo, :brand, :model, :sn, :cup, :ram, :local_disk, :os, :place, :position, :service_expired_day, :function, :remark, :user_id
  json.url server_url(server, format: :json)
end
