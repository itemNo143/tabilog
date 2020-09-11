class TravelsController < ApplicationController
  before_action :set_travel, only: %i[edit update destroy]

  def index
    @travel = Travel.new
    @travel.users << current_user
  end

  def edit
  end

  def create
    @travel = Travel.new(travel_params)
    if @travel.save
      redirect_to travels_path, notice: 'アルバムを作成しました'
    else
      render :index
    end
  end

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

  def destroy
    @travel.destroy
    respond_to do |format|
      format.html { redirect_to travels_url, notice: 'Travel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_travel
    @travel = Travel.find(params[:id])
  end

  def travel_params
    params.require(:travel).permit(:name, :start_date, :end_date, :image, user_ids: [])
  end

end
