class ApplicationController < ActionController::Base
  protect_from_forgery

	def current_user
		User.find_by_id(session["user_id"])
	end

	def require_login
   	if current_user.present?
   		else redirect_to root_url, notice: 'Please login.' 
  	end
	end

	def require_auth_or_admin
  	if session["user_id"] == params["user_id"].to_i || current_user.type == "Admin"
  		else redirect_to root_url, notice: 'Not auth or admin.' 
  	end
	end

	def require_admin
	@user = User.find_by_id(session[:user_id])
	if @user.type == "Admin"
	  else redirect_to root_url, notice: 'Admin access only' 
	end
	end

	def require_teacher
	@user = User.find_by_id(session[:user_id])
	if @user.type == "Teacher"
	  else redirect_to root_url, notice: 'Teacher access only' 
	end
	end


end
