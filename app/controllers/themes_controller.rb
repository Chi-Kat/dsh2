 class ThemesController < ApplicationController

before_filter :require_admin, :except => [:index, :show]

def current_theme_selector
  @theme = Theme.find(params[:id])
  @themes = Theme.all
  
  @theme.current_theme = true
  @theme.save

  @themes.each do |theme|
    if theme.id != @theme.id
      theme.current_theme = false
      theme.save
    end
  end
  
  redirect_to themes_url
end

  def current_user
    User.find_by_id(session["user_id"])
  end
  
  def require_admin
    if current_user.type == "Admin"
    else redirect_to root_url, notice: 'Admin access only' 
    end
  end
  
  def index
    @themes = Theme.order('created_at').all
    @theme_suggestions = ThemeSuggestion.all
    @theme_suggestion = ThemeSuggestion.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @themes }
    end
  end

  # GET /themes/1
  # GET /themes/1.json
  def show
    @theme = Theme.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @theme }
    end
  end

  # GET /themes/new
  # GET /themes/new.json
  def new
    @theme = Theme.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @theme }
    end
  end

  # GET /themes/1/edit
  def edit
    @theme = Theme.find(params[:id])
  end

  # POST /themes
  # POST /themes.json
  def create
    @theme = Theme.new(params[:theme])
    @theme_suggestion = ThemeSuggestion.new(params[:theme_suggestion])

    respond_to do |format|
      if @theme.save
        format.html { redirect_to @theme, notice: 'Theme was successfully created.' }
        format.json { render json: @theme, status: :created, location: @theme }
      else
        format.html { render action: "new" }
        format.json { render json: @theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /themes/1
  # PUT /themes/1.json
  def update
    @theme = Theme.find(params[:id])

    respond_to do |format|
      if @theme.update_attributes(params[:theme])
        format.html { redirect_to @theme, notice: 'Theme was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /themes/1
  # DELETE /themes/1.json
  def destroy
    @theme = Theme.find(params[:id])
    @theme.destroy

    respond_to do |format|
      format.html { redirect_to themes_url }
      format.json { head :no_content }
    end
  end
end
