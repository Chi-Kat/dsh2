class PagesController < ApplicationController

	before_filter :require_login
	before_filter :require_admin, :only => [:admin]
	before_filter :require_teacher, :only => [:teacher]


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
	    @user = User.find_by_id(session[:user_id])
	    @asset = Asset.new
	    @classroom = Classroom.find_by_id(@user.classroom_id)
	    @form_type = params[:form_type]
	    @region = Region.find(@classroom.region_id)
	end

end