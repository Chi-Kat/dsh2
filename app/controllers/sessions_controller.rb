class SessionsController < ApplicationController

	def new
	end

	def create

		@email = params[:email]
		user = User.find_by_email(@email)
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to root_url, notice: "Signed in as #{@email}."
		else 
			redirect_to new_sessions_url, notice: "Sign in unsuccessful."
		end
	end

 	def destroy
    reset_session
    redirect_to root_url, notice: "See ya!"
  	end

end
