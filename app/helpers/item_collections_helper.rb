module ItemCollectionsHelper
  def defaultCollection(title, user_id, time)
    @collectionItem = ItemCollection.new
    @collectionItem.name=title
    @collectionItem.beginDate=time
    @collectionItem.user_id= user_id
    @collectionItem.save
  end

  # untested
  # def is_item_collection_owner(item_collection)
  #   if current_user.nil? || item_collection.nil? || item_collection.id.nil?
  #     return false
  #   end
  #
  #   current_user.id == item_collection.user_id
  # end
end
