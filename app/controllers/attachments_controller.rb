class AttachmentsController < ApplicationController
 
 before_filter :require_login, :except => [:index, :show]
 before_filter :require_auth_or_admin, :only => [:update, :edit, :destroy, :new]
 # before_filter :require_authorization, :except => [:index, :show, :new, :create]

  def index
    
    # Filter attachments by chosen criteria
    @attachments = Attachment.scoped
    @attachments = @attachments.where( :theme_id =>  params["theme_id"])         unless params["theme_id"].blank?
    @attachments = @attachments.where( :classroom_id =>  params["classroom_id"]) unless params["classroom_id"].blank?
    @attachments = @attachments.where( :region_id =>  params["region_id"]) unless params["region_id"].blank?
    @attachments = @attachments.order("updated_at")

    @theme_id = params["theme_id"]
    @classroom_id = params["classroom_id"]
    @region_id = params["region_id"]


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attachments }
    end
  end

  def admin
  end

  # GET /attachments/1
  # GET /attachments/1.json
  def show
    @attachment = Attachment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attachment }
    end
  end

  # GET /attachments/new
  # GET /attachments/new.json
  def pdf
    @attachment = Attachment.new
  end

  def new
    @attachment = Attachment.new

    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end
  

  # GET /attachments/1/edit
  def edit
    @attachment = Attachment.find(params[:id])
  end

  # POST /attachments
  # POST /attachments.json
  def create
    @attachment = Attachment.new(params[:attachment])

    respond_to do |format|
      if @attachment.save
        format.html { redirect_to @attachment, notice: 'Attachment was successfully created.' }
        format.json { render json: @attachment, status: :created, location: @attachment }
      else
        format.html { render action: "new" }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attachments/1
  # PUT /attachments/1.json
  def update
    @attachment = Attachment.find(params[:id])

    respond_to do |format|
      if @attachment.update_attributes(params[:attachment])
        format.html { redirect_to @attachment, notice: 'Attachment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy

    respond_to do |format|
      format.html { redirect_to attachments_url }
      format.json { head :no_content }
    end
  end
end
