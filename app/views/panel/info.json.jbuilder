json.array!(@users) do |user|
  json.extract! user, :id, :username, :name, :age,:sex, :school,:college,:profession, :work
  json.url user_url(user, format: :json)
end
