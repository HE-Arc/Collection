module UsersHelper
  def userCollection(userID)
    ItemCollection.where("user_id = ?",userID).first
  end
end
