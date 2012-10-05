class VillasController < ApplicationController
  # GET /villas
  # GET /villas.json
  def index
    @villas = Villa.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @villas }
    end
  end

  # GET /villas/1
  # GET /villas/1.json
  def show
    @villa = Villa.find(params[:id])
    @images = @villa.photos
    @date = params[:date] ? Date.parse(params[:date]) : Date.today

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @villa }
    end
  end

  # GET /villas/new
  # GET /villas/new.json
  def new
    @villa = Villa.new
     @villa.photos.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @villa }
    end
  end

  # GET /villas/1/edit
  def edit
    @villa = Villa.find(params[:id])
     @villa.photos.build
  end

  # POST /villas
  # POST /villas.json
  def create
    @villa = Villa.new(params[:villa])

    respond_to do |format|
      if @villa.save
        format.html { redirect_to @villa, notice: 'Villa was successfully created.' }
        format.json { render json: @villa, status: :created, location: @villa }
      else
        format.html { render action: "new" }
        format.json { render json: @villa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /villas/1
  # PUT /villas/1.json
  def update
    @villa = Villa.find(params[:id])

    respond_to do |format|
      if @villa.update_attributes(params[:villa])
        format.html { redirect_to @villa, notice: 'Villa was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @villa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /villas/1
  # DELETE /villas/1.json
  def destroy
    @villa = Villa.find(params[:id])
    @villa.destroy

    respond_to do |format|
      format.html { redirect_to villas_url }
      format.json { head :no_content }
    end
  end
end
