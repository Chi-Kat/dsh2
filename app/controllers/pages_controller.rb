class PagesController < ApplicationController

	#before_filter :require_login
	before_filter :require_admin, :only => [:admin]
	before_filter :require_facilitator, :only => [:facilitator]


	def about
	end

	def admin
		@user = User.find_by_id(session[:user_id])
		@attachment = Attachment.new
		@classroom = Classroom.new
		@theme = Theme.new
		@new_user = User.new
		@form_type = params[:form_type]
	end

	def facilitator
	    @user = User.find_by_id(session[:user_id])
	    @attachment = Attachment.new
	    @classroom = Classroom.find_by_id(@user.classroom_id)
	    @form_type = params[:form_type]
	    @region = Region.find(@classroom.region_id)
	end

  def home

    @theme_of_the_month = Theme.find_by_current_theme(true)
    
    if params["theme_id"].present?
    	@selected_theme = Theme.find(params["theme_id"])
    	@current_theme = @selected_theme
    else
    	@current_theme = @theme_of_the_month
    end
 	
    @array_of_classroom_ids = array_of_classroom_ids_by_theme_id(@current_theme.id)

    @array_of_last_updated_attachment_per_classroom_by_theme_id = array_of_last_updated_attachment_per_classroom_by_theme_id(@current_theme)
	
	@array_of_classrooms_by_theme_id = array_of_classrooms_by_theme_id(@current_theme)

   	
   	respond_to do |format|
    	format.html # index.html.erb
        format.json { render json: @attachments }
    end
  end
  
end