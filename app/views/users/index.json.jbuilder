json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :address, :city, :state, :zip, :country
  json.url user_url(user, format: :json)
end
