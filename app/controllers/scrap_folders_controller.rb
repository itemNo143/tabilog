class ScrapFoldersController < ApplicationController
  before_action :set_scrap_folder, only: %i[show edit update destroy]
  before_action :set_travel

  def index
    @scrap_folder = ScrapFolder.new
    @scrap_folders = @travel.scrap_folders.includes(:scraps)
  end

  def new
    @scrap_folder = ScrapFolder.new
  end

  def edit
  end

  def create
    @scrap_folder = @travel.scrap_folders.new(scrap_folder_params)
    if @scrap_folder.save
      redirect_to travel_scrap_folders_path(@travel), notice: 'フォルダーを作成しました'
    else
      render :index
    end
  end

  def update
    respond_to do |format|
      if @scrap_folder.update(scrap_folder_params)
        format.html { redirect_to @scrap_folder, notice: 'Scrap folder was successfully updated.' }
        format.json { render :show, status: :ok, location: @scrap_folder }
      else
        format.html { render :edit }
        format.json { render json: @scrap_folder.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @scrap_folder.destroy
    respond_to do |format|
      format.html { redirect_to scrap_folders_url, notice: 'Scrap folder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_scrap_folder
    @scrap_folder = ScrapFolder.find(params[:id])
  end

  def set_travel
    @travel = Travel.find(params[:travel_id])
  end

  def scrap_folder_params
    params.require(:scrap_folder).permit(:name).merge(travel_id: params[:travel_id])
  end
end
