module ApplicationHelper
  def bootstrap_class_for flash_type
    # if the alert level is not indicated, it's by default a success, we do this because all our "notice" doesn't provide an alert level

    result = flash_type
    case flash_type
      when "alert"
        result = "warning"
      when "notice"
        result = "success"
      when "error"
        result = "danger"
      else
    end
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert alert-#{bootstrap_class_for(msg_type)} fade in") do
               concat content_tag(:button, 'x', class: "close", data: {dismiss: 'alert'})
               concat message
             end)
    end
    nil
  end

  def is_cd_owner(cd)
    if current_user.nil? || cd.nil? || cd.id.nil?
      return false
    end

    current_user.id == ItemCollection.find(cd.item_collection_id).user_id
  end

  # #untested
  # def is_item_collection_owner(item_collection)
  #   if current_user.nil? || item_collection.nil? || item_collection.id.nil?
  #     return false
  #   end
  #
  #   current_user.id == item_collection.user_id
  # end
  #
  # # untested
  # def is_track_owner(track)
  #   if current_user.nil? || track.nil? || track.id.nil?
  #     return false
  #   end
  #
  #   cd = Cd.find(track.cd_id)
  #   if cd.nil?
  #     return false
  #   end
  #
  #   current_user.id == ItemCollection.find(cd.item_collection_id).user_id
  # end
end
