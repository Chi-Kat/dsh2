class FacilitatorsController < ApplicationController
  # GET /facilitators
  # GET /facilitators.json
  def index
    @facilitators = Facilitator.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @facilitators }
    end
  end

  # GET /facilitators/1
  # GET /facilitators/1.json
  def show
      @facilitator = Facilitator.find(params[:id])
      #@user = User.find_by_id(session[:user_id])
      @attachment = Attachment.new
      @classroom = Classroom.find_by_id(@facilitator.classroom_id)
      @form_type = params[:form_type]
      @region = Region.find(@classroom.region_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @facilitator }
    end
  end

  # GET /facilitators/new
  # GET /facilitators/new.json
  def new
    @facilitator = Facilitator.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @facilitator }
    end
  end

  # GET /facilitators/1/edit
  def edit
    @facilitator = Facilitator.find(params[:id])
  end

  # POST /facilitators
  # POST /facilitators.json
  def create
    @facilitator = Facilitator.new(params[:facilitator])

    facilitator = params[:facilitator]
    classroom = Classroom.new
    classroom.name = facilitator["classroom"]
    classroom.region_id = facilitator["region_id"]
    classroom.save

    @facilitator = Facilitator.new
    @facilitator.name = facilitator["name"]
    @facilitator.classroom_id = Classroom.find_by_name(facilitator["classroom"]).id
    @facilitator.email = facilitator["email"]
    @facilitator.password = "facilitator"
    @facilitator.password_confirmation = "facilitator"

    respond_to do |format|
      if @facilitator.save
        format.html { redirect_to @facilitator, notice: 'Facilitator was successfully created.' }
        format.json { render json: @facilitator, status: :created, location: @facilitator }
      else
        format.html { render action: "new" }
        format.json { render json: @facilitator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /facilitators/1
  # PUT /facilitators/1.json
  def update
    @facilitator = Facilitator.find(params[:id])

    respond_to do |format|
      if @facilitator.update_attributes(params[:facilitator])
        format.html { redirect_to @facilitator, notice: 'Facilitator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @facilitator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facilitators/1
  # DELETE /facilitators/1.json
  def destroy
    @facilitator = Facilitator.find(params[:id])
    @facilitator.destroy

    respond_to do |format|
      format.html { redirect_to facilitators_url }
      format.json { head :no_content }
    end
  end
end
