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
  	# @attachments = Attachment.scoped
    # @attachments = @attachments.where( :theme_id =>  params["theme_id"])         unless params["theme_id"].blank?
    # @attachments = @attachments.where( :classroom_id =>  params["classroom_id"]) unless params["classroom_id"].blank?
    # @attachments = @attachments.where( :region_id =>  params["region_id"]) unless params["region_id"].blank?
	# @attachments = @attachments.order("updated_at")
	@theme_of_the_month = Theme.find_by_name("Classroom")
    @theme_id = params["theme_id"]
    # @classroom_id = params["classroom_id"]
    # @region_id = params["region_id"]

    @attachments = Attachment.scoped
    @selected_theme_id = params["theme_id"]
    if @selected_theme_id == nil
    	@selected_theme_id = @theme_of_the_month.id
    end
 	@current_theme = Theme.find_by_id(@selected_theme_id)
    @array_of_classroom_ids = array_of_classroom_ids(@current_theme.id)




   	respond_to do |format|
    	format.html # index.html.erb
        format.json { render json: @attachments }
    end
  end
  
end