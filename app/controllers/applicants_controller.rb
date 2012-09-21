class ApplicantsController < ApplicationController
 
  before_filter :require_admin, :only => [:index, :show, :edit, :update, :destroy]

  # GET /applicants
  # GET /applicants.json
  def index
    @applicants = Applicant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @applicants }
    end
  end

  # GET /applicants/1
  # GET /applicants/1.json
  def show
    @applicant = Applicant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @applicant }
    end
  end

  # GET /applicants/new
  # GET /applicants/new.json
  def new
    @applicant = Applicant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @applicant }
    end
  end

  # GET /applicants/1/edit
  def edit
    @applicant = Applicant.find(params[:id])
  end

  # POST /applicants
  # POST /applicants.json
  def create
    @applicant = Applicant.new(params[:applicant])

    respond_to do |format|
      if @applicant.save
        ApplicantMailer.application_confirmation(@applicant).deliver
        ApplicantMailer.application_notification(@applicant).deliver
        format.html { redirect_to root_url, notice: 'Applicant was successfully created.' }
        format.json { render json: @applicant, status: :created, location: @applicant }
      else
        format.html { render action: "new" }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end



  # PUT /applicants/1 
  # PUT /applicants/1.json
  def update
    @applicant = Applicant.find(params[:id])

    respond_to do |format|
      if @applicant.update_attributes(params[:applicant])
        format.html { redirect_to admin_url(current_user.id), notice: 'Applicant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applicants/1
  # DELETE /applicants/1.json
  def destroy
    @applicant = Applicant.find(params[:id])
    @status = params[:commit]
    if @status == "Accept"
      #Create classroom according to applicant
      classroom = Classroom.new
      classroom.name = @applicant.classroom
      classroom.region_id = @applicant.region_id
      classroom.save
      classroom_id = Classroom.last.id

      temp_password = (0...8).map{65.+(rand(25)).chr}.join

      facilitator = Facilitator.new
      facilitator.name = @applicant.name
      facilitator.email = @applicant.email
      facilitator.classroom_id = classroom_id
      facilitator.password = temp_password
      facilitator.password_confirmation = temp_password
      facilitator.save
      facilitator = Facilitator.last

      ApplicantMailer.application_acceptance(facilitator,temp_password).deliver
    elsif @status == "Reject"
      ApplicantMailer.application_termination(@applicant).deliver
    end

    @applicant.destroy

    respond_to do |format|
      format.html { redirect_to admin_url(current_user.id) }
      format.json { head :no_content }
    end
  end
end
