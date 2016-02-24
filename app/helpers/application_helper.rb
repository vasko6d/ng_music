module ApplicationHelper
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    #reference https://gist.github.com/suryart/7418454. Jun28, 2014 post by suryart
    full_flash = "" 
    flash.each do |msg_type, message|
      piece = "<div class='alert " + bootstrap_class_for(msg_type) + " alert-dismissible' role='alert'> <button class='close' data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>" + message + "</div>"
      full_flash = full_flash + piece
    end
    return full_flash.html_safe
  end
end
