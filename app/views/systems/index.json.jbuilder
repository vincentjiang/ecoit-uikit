json.array!(@systems) do |system|
  json.extract! system, :id, :name, :link, :username, :password, :user_id
  json.url system_url(system, format: :json)
end
