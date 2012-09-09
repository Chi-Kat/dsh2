class PagesController < ApplicationController

	def about
	end

	def admin
		@user = User.find_by_id(session[:user_id])
		@asset = Asset.new
		@classroom = Classroom.new
		@theme = Theme.new
		@user = User.new
		@form_type = params[:form_type]
	end

	def teacher
	    @asset = Asset.new
	end

end