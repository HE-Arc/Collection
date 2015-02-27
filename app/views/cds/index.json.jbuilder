json.array!(@cds) do |cd|
  json.extract! cd, :id, :artist, :name, :editor, :cover, :year, :gender, :purchaseDate, :item_collection_id
  json.url cd_url(cd, format: :json)
end
