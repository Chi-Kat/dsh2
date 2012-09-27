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

	def require_facilitator
	@user = User.find_by_id(session[:user_id])
	if @user.type == "Facilitator"
	  else redirect_to root_url, notice: 'Facilitator access only' 
	end
	end

	def admin?
    	if self.type == "Admin"
    		true
  		else
    		false
  		end
	end

	def facilitator?
  		if self.type == "Facilitator"
    		true
  		else
    		false
  		end
	end

	def array_of_classroom_ids_with_selected_theme(theme_id)
		classrooms_array = []
		classrooms = Classroom.all
		classrooms.each do |classroom|
			attachments = Attachment.scoped
			attachments = attachments.where(:theme_id => theme_id)
			if attachments.find_by_classroom_id(classroom.id) != nil
				classrooms_array.push classroom.id
			end
		end
		return classrooms_array
	end
	
end
