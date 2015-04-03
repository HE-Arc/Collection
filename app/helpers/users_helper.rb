module UsersHelper
  def get_user_default_collection(userID)
    ItemCollection.where("user_id = ?", userID).first
  end
end
