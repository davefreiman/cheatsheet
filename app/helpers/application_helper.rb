module ApplicationHelper
  
  def user_check
    if logged_in?
      link_to 'logout', logout_path, :method => :delete

    else     
      link_to 'login', login_path
    end  
  end

end
