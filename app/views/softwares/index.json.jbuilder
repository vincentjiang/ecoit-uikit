json.array!(@softwares) do |software|
  json.extract! software, :id, :name, :kind, :sn, :service_expired_day, :function, :remark, :user_id
  json.url software_url(software, format: :json)
end
