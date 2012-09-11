module ApplicationHelper

	def current_user
    User.find_by_id(session["user_id"])
  end

  def logged_in?
    User.find_by_id(session["user_id"]).present?
  end
  
  def require_login
    if current_user.present?
	     else redirect_to root_url, notice: 'Please login.' 
		end
  end

end
