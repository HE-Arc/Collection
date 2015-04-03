module ApplicationHelper
  def bootstrap_class_for flash_type
    # if the alert level is not indicated, it's by default a success, we do this because all our "notice" doesn't provide an alert level
    {success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info"}[flash_type] || 'success'
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
end
