class CostaTropicalsController < ApplicationController
  before_filter :authorize, only: [:edit, :update]
  # GET /costa_tropicals
  # GET /costa_tropicals.json
  def index
    @costa_tropicals = CostaTropical.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @costa_tropicals }
    end
  end

  # GET /costa_tropicals/1
  # GET /costa_tropicals/1.json
  def show
    @costa_tropical = CostaTropical.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @costa_tropical }
    end
  end

  # GET /costa_tropicals/new
  # GET /costa_tropicals/new.json
  def new
    @costa_tropical = CostaTropical.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @costa_tropical }
    end
  end

  # GET /costa_tropicals/1/edit
  def edit
    @costa_tropical = CostaTropical.find(params[:id])
  end

  # POST /costa_tropicals
  # POST /costa_tropicals.json
  def create
    @costa_tropical = CostaTropical.new(params[:costa_tropical])

    respond_to do |format|
      if @costa_tropical.save
        format.html { redirect_to @costa_tropical, notice: 'Costa tropical was successfully created.' }
        format.json { render json: @costa_tropical, status: :created, location: @costa_tropical }
      else
        format.html { render action: "new" }
        format.json { render json: @costa_tropical.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /costa_tropicals/1
  # PUT /costa_tropicals/1.json
  def update
    @costa_tropical = CostaTropical.find(params[:id])

    respond_to do |format|
      if @costa_tropical.update_attributes(params[:costa_tropical])
        format.html { redirect_to @costa_tropical, notice: 'Costa tropical was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @costa_tropical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /costa_tropicals/1
  # DELETE /costa_tropicals/1.json
  def destroy
    @costa_tropical = CostaTropical.find(params[:id])
    @costa_tropical.destroy

    respond_to do |format|
      format.html { redirect_to costa_tropicals_url }
      format.json { head :no_content }
    end
  end
end
