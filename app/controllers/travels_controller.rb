class TravelsController < ApplicationController
  before_action :set_travel, only: %i[show edit update destroy]

  # GET /travels
  # GET /travels.json
  def index
    # @travels = Travel.all
    @travel = Travel.new
    @travel.users << current_user
  end

  # GET /travels/1
  # GET /travels/1.json
  def show
  end

  # GET /travels/new
  def new
    @travel = Travel.new
  end

  # GET /travels/1/edit
  def edit
  end

  # POST /travels
  # POST /travels.json
  def create
    @travel = Travel.new(travel_params)
    if @travel.save
      redirect_to travels_path, notice: 'アルバムを作成しました'
    else
      @travel.build
      render :index
    end
  end

  # PATCH/PUT /travels/1
  # PATCH/PUT /travels/1.json
  def update
    respond_to do |format|
      if @travel.update(travel_params)
        format.html { redirect_to @travel, notice: 'Travel was successfully updated.' }
        format.json { render :show, status: :ok, location: @travel }
      else
        format.html { render :edit }
        format.json { render json: @travel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travels/1
  # DELETE /travels/1.json
  def destroy
    @travel.destroy
    respond_to do |format|
      format.html { redirect_to travels_url, notice: 'Travel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_travel
    @travel = Travel.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def travel_params
    params.require(:travel).permit(:name, :start_date, :end_date, :image, user_ids: [])
  end
end
