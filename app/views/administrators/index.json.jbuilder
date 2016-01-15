json.array!(@administrators) do |administrator|
  json.extract! administrator, :id, :username, :hashed_password, :salt, :is_admin
  json.url administrator_url(administrator, format: :json)
end
