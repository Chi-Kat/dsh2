class AssetsController < ApplicationController
 
 before_filter :require_login, :except => [:index, :show]
 #before_filter :require_authorization, :except => [:index, :show, :new, :create]
 before_filter :require_auth_or_admin, :only => [:update, :edit, :destroy, :new]

  def current_user
    User.find_by_id(session["user_id"])
  end

  def require_login
     if current_user.present?
     else redirect_to root_url, notice: 'Please login.' 
    end
  end

  # def require_authorization
  #   if session["user_id"] == params["user_id"].to_i
  #   else redirect_to root_url, notice: 'Require authorization'
  #   end
  # end

  # def require_admin
  #   if current_user.role == "Admin"
  #   else redirect_to root_url, notice: 'Admin access only' 
  #   end
  # end

  def require_auth_or_admin
    if session["user_id"] == params["user_id"].to_i || current_user.role == "Admin"
    else redirect_to root_url, notice: 'Not auth or admin.' 
    end
  end


  def index
    @assets = Asset.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assets }
    end
  end

  def admin
  end

  # GET /assets/1
  # GET /assets/1.json
  def show
    @asset = Asset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @asset }
    end
  end

  # GET /assets/new
  # GET /assets/new.json

  def pdf
    @asset = Asset.new
  end

  def new
    @asset = Asset.new

    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end
  

  # GET /assets/1/edit
  def edit
    @asset = Asset.find(params[:id])
  end

  # POST /assets
  # POST /assets.json
  def create
    @asset = Asset.new(params[:asset])

    respond_to do |format|
      if @asset.save
        format.html { redirect_to @asset, notice: 'Asset was successfully created.' }
        format.json { render json: @asset, status: :created, location: @asset }
      else
        format.html { render action: "new" }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /assets/1
  # PUT /assets/1.json
  def update
    @asset = Asset.find(params[:id])

    respond_to do |format|
      if @asset.update_attributes(params[:asset])
        format.html { redirect_to @asset, notice: 'Asset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assets/1
  # DELETE /assets/1.json
  def destroy
    @asset = Asset.find(params[:id])
    @asset.destroy

    respond_to do |format|
      format.html { redirect_to assets_url }
      format.json { head :no_content }
    end
  end
end
