class ThemeSuggestionsController < ApplicationController

  before_filter :require_login

  def index
    @theme_suggestions = ThemeSuggestion.all
    @theme_suggestion = ThemeSuggestion.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @theme_suggestions }
    end
  end

  def new
    @theme_suggestion = ThemeSuggestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @theme_suggestion }
    end
  end

  def create
    @theme_suggestion = ThemeSuggestion.new(params[:theme_suggestion])

    respond_to do |format|
      if @theme_suggestion.save
        format.html { redirect_to theme_suggestions_url, notice: 'Theme suggestion was successfully created.' }
        format.json { render json: @theme_suggestion, status: :created, location: @theme_suggestion }
      else
        format.html { render action: "new" }
        format.json { render json: @theme_suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @theme_suggestion = ThemeSuggestion.find(params[:id])
    @theme_suggestion.destroy

    respond_to do |format|
      format.html { redirect_to theme_suggestions_url }
      format.json { head :no_content }
    end
  end
end
