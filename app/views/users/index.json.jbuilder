json.array!(@users) do |user|
  json.extract! user, :id, :name, :firstname, :pseudo, :anonym, :birthdate, :email, :password
  json.url user_url(user, format: :json)
end
