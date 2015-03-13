module ItemCollectionsHelper
  def defaultCollection(title,user_id,time)
    @collectionItem = ItemCollection.new
    @collectionItem.name=title
    @collectionItem.beginDate=time
    @collectionItem.user_id= user_id
    @collectionItem.save
  end
end
