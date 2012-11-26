class VillasController < ApplicationController
  before_filter :authorize, only: [:edit, :update]
  require 'date'
  # GET /villas
  # GET /villas.json

  def index

    if params[:location_id]
      @locations = Location.all
      @villas = Villa.by_locations(params[:location_id])
    elsif params[:sleeps]
      @villas = Villa.find_all_by_sleeps(params[:sleeps][:num])
    elsif params[:bedrooms]
      @villas = Villa.find_all_by_bedrooms(params[:bedrooms][:num])
    else
      @villas = Villa.all
    end

    @photos = Photo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @photos.collect { |p| p.to_jq_upload }.to_json  }
    end
  end

  # GET /villas/1
  # GET /villas/1.json
  def show
    @villa = Villa.find(params[:id])
    @images = @villa.photos
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @json = @villa.to_gmaps4rails
    @rates = @villa.rates.scoped.order("created_at ASC")

    @res_by_start = @villa.reservations.group_by(&:start_date)

    unless @villa.reservations.first.nil?
      first = @villa.reservations.first.start_date.beginning_of_month.beginning_of_week(:monday)
      @reservations = @villa.reservations.where("start_date > ?", first)
    end

    @photo = @villa.photos.build
    @photos = Photo.scoped(:conditions => [ 'villa_id = ?', @villa.id ] )

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @villa }
    end
  end

  # GET /villas/new
  # GET /villas/new.json
  def new
    @villa = Villa.new
    #@villa.photos.build
    @object_new = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @villa }
    end
  end

  # GET /villas/1/edit
  def edit
    @villa = Villa.find(params[:id])
    #@villa.photos.build
    @object_new = Photo.new
  end

  # POST /villas
  # POST /villas.json
  def create
    #@villa = Villa.new(params[:villa])
    villa_data = params[:villa]
    photo_ids = villa_data.delete :photo_ids
    @villa = Villa.new(villa_data)

    respond_to do |format|
      if @villa.save
        update_photos_with_villa_id photo_ids, @villa

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
    villa_data = params[:villa]
    photo_ids = villa_data.delete :photo_ids

    respond_to do |format|
      if @villa.update_attributes(villa_data)
        update_photos_with_villa_id photo_ids, @villa

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

  private
    def update_photos_with_villa_id photo_ids, villa
      photo_ids.split(',').each do |id|
        photo = Photo.where(id: id).first
        photo.update_attributes(villa_id: villa.id) if photo.present?
      end
    end
end
