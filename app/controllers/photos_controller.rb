class PhotosController < ApplicationController
  
  respond_to :js, :html, :json
  
  before_filter :load_villa
  # GET /pictures
  # GET /pictures.json
  def index
    @photos = @villa.photos
    render :json => @photos.collect { |p| p.to_jq_upload }.to_json
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @villa = Villa.find(params[:villa_id])
    @photo = @villa.photos.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /pictures/1/edit
  def edit
    @villa = Villa.find(params[:villa_id])

    @photo = @villa.photos.find(params[:id])
    # @photo = Photo.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  def create
    logger = Logger.new('log/debug.log')
    logger.info('-------Log for create image-------')
    #logger.info(params[:picture].to_s)
    @photo = @villa.photos.new
    
    @photo.image = params[:photo][:path].shift
    if @photo.save
      logger.info('Saved')
      logger.info(@photo.image.url.to_s)
      respond_to do |format|
        format.html { #(html response is for browsers using iframe sollution)
          render :json => [@photo.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@photo.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update

    @villa = Villa.find(params[:villa_id])

    @photo = @villa.photos.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to villa_path(@villa), notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    render :json => true
  end

  def make_default
    @photo = Photo.find(params[:id])
    @villa = Villa.find(params[:villa_id])

    @villa.cover = @photo.id
    @villa.save

    respond_to do |format|
      format.js
    end
  end
  
  private
  
    def load_villa
      @villa = Villa.find(params[:apt_id])
    end
  
end