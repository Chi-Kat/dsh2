class PagesController < ApplicationController

	def about
	end

	def admin
		@user = User.find_by_id(session[:user_id])
	end

	def teacher
	    @asset = Asset.new
	end

end