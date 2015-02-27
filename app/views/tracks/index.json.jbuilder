json.array!(@tracks) do |track|
  json.extract! track, :id, :title, :trackNumber, :cd_id
  json.url track_url(track, format: :json)
end
