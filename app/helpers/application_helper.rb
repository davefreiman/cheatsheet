module ApplicationHelper
  
  def user_check
    if logged_in?
      link_to 'logout', logout_path, :method => :delete

    else     
      link_to 'login', login_path
    end  
  end

  def get_stat player, field, mode = nil
    if mode && mode == 'average'
      player.average_stat(field)
    # elsif mode && mode == 'season'
    else
      player.send(field.to_sym)
    end
  end

end
