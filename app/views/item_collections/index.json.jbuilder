json.array!(@item_collections) do |item_collection|
  json.extract! item_collection, :id, :name, :beginDate, :user_id
  json.url item_collection_url(item_collection, format: :json)
end
