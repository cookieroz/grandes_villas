class Admin::PhotosController < ApplicationController
  before_filter :authorize

  # GET /admin/photos
  # GET /admin/photos.json
  def index
    @top_photos = Photo.where(:imageable_type => "TopPhoto")
    @sug_photos = Photo.where(:imageable_type => "SugPhoto")
    @bottom_photos = Photo.where(:imageable_type => "BottomPhoto")
  end

  # GET /admin/photos/new
  # GET /admin/photos/new.json
  def new
    @admin_photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_photo }
    end
  end

  # POST /admin/photos
  # POST /admin/photos.json
  def create
    @admin_photo = Photo.new(params[:photo])

    p params[:imageable_type]
    if ["TopPhoto", "BottomPhoto", "SugPhoto"].include?(params[:imageable_type])
      @admin_photo.imageable_type = params[:imageable_type]
    end

    respond_to do |format|
      if @admin_photo.save
        format.html { redirect_to admin_photos_path, notice: 'Photo was successfully created.' }
        format.json { render json: @admin_photo, status: :created, location: @admin_photo }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/photos/1
  # PUT /admin/photos/1.json
  def edit
    @admin_photo = Photo.find(params[:id])
    #@villa.photos.build
  end

  def update
    @admin_photo = Photo.find(params[:id])

    respond_to do |format|
      if @admin_photo.update_attributes(params[:photo])
        format.html { redirect_to admin_photos_path, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/photos/1
  # DELETE /admin/photos/1.json
  def destroy
    @admin_photo = Photo.find(params[:id])
    @admin_photo.destroy

    respond_to do |format|
      format.html { redirect_to admin_photos_url }
      format.json { head :no_content }
    end
  end
end
