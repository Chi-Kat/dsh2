class ClassroomsController < ApplicationController

 before_filter :require_login, :except => [:index, :show]
 before_filter :require_auth_or_admin, :only => [:new, :create, :update, :edit, :destroy]

 def current_user
    User.find_by_id(session["user_id"])
  end

 def require_login
     if current_user.present?
     else redirect_to root_url, notice: 'Please login.' 
    end
  end

  def require_auth_or_admin
    if current_user.classroom_id == params["id"].to_i || current_user.type == "Admin"
    else redirect_to root_url, notice: 'Not auth or admin.' 
    end
  end

  def index
    @classrooms = Classroom.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @classrooms }
    end
  end

  # GET /classrooms/1
  # GET /classrooms/1.json
  def show
    @classroom = Classroom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @classroom }
    end
  end

  # GET /classrooms/new
  # GET /classrooms/new.json
  def new
    @classroom = Classroom.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @classroom }
    end
  end

  # GET /classrooms/1/edit
  def edit
    @classroom = Classroom.find(params[:id])
  end

  # POST /classrooms
  # POST /classrooms.json
  def create
    @classroom = Classroom.new(params[:classroom])

    respond_to do |format|
      if @classroom.save
        format.html { redirect_to @classroom, notice: 'Classroom was successfully created.' }
        format.json { render json: @classroom, status: :created, location: @classroom }
      else
        format.html { render action: "new" }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /classrooms/1
  # PUT /classrooms/1.json
  def update
    @classroom = Classroom.find(params[:id])

    respond_to do |format|
      if @classroom.update_attributes(params[:classroom])
        format.html { redirect_to @classroom, notice: 'Classroom was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classrooms/1
  # DELETE /classrooms/1.json
  def destroy
    @classroom = Classroom.find(params[:id])
    @classroom.destroy

    respond_to do |format|
      format.html { redirect_to classrooms_url }
      format.json { head :no_content }
    end
  end
end
