class ServicesOfferedsController < ApplicationController
  # GET /services_offereds
  # GET /services_offereds.json
  def index
    @services_offereds = ServicesOffered.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @services_offereds }
    end
  end

  # GET /services_offereds/1
  # GET /services_offereds/1.json
  def show
    @services_offered = ServicesOffered.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @services_offered }
    end
  end

  # GET /services_offereds/new
  # GET /services_offereds/new.json
  def new
    @services_offered = ServicesOffered.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @services_offered }
    end
  end

  # GET /services_offereds/1/edit
  def edit
    @services_offered = ServicesOffered.find(params[:id])
  end

  # POST /services_offereds
  # POST /services_offereds.json
  def create
    @services_offered = ServicesOffered.new(params[:services_offered])

    respond_to do |format|
      if @services_offered.save
        format.html { redirect_to @services_offered, notice: 'Services offered was successfully created.' }
        format.json { render json: @services_offered, status: :created, location: @services_offered }
      else
        format.html { render action: "new" }
        format.json { render json: @services_offered.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /services_offereds/1
  # PUT /services_offereds/1.json
  def update
    @services_offered = ServicesOffered.find(params[:id])

    respond_to do |format|
      if @services_offered.update_attributes(params[:services_offered])
        format.html { redirect_to @services_offered, notice: 'Services offered was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @services_offered.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services_offereds/1
  # DELETE /services_offereds/1.json
  def destroy
    @services_offered = ServicesOffered.find(params[:id])
    @services_offered.destroy

    respond_to do |format|
      format.html { redirect_to services_offereds_url }
      format.json { head :no_content }
    end
  end
end
