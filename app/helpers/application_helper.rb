module ApplicationHelper

  def active_class(name)
    controller_name == name ? "active" : ""
  end

  def flash_class(level)
    case level
    when "notice" then "alert alert-info"
    when "success" then "alert alert-success"
    when "error" then "alert alert-error"
    when "alert" then "alert alert-error"
    else
      "alert alert-info"
    end
  end

  def simple_time(time)
    time.strftime("%-d-%b-%y %H:%M") if time
  end

end
