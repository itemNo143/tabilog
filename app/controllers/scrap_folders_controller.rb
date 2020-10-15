class ScrapFoldersController < ApplicationController
  before_action :set_scrap_folder, only: %i[update destroy]
  before_action :set_travel, only: %i[index create]

  def index
    @scrap_folder  = ScrapFolder.new
    @scrap_folders = @travel.scrap_folders.includes(:scraps)
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
    if @scrap_folder.update(scrap_folder_params)
      redirect_to scrap_folder_scraps_path(@scrap_folder), notice: 'フォルダーを更新しました'
    else
      redirect_to scrap_folder_scraps_path(@scrap_folder), notice: 'フォルダーの更新に失敗しました'
    end
  end

  def destroy
    @travel = @scrap_folder.travel_id
    if @scrap_folder.destroy
      redirect_to travel_scrap_folders_path(@travel), notice: '削除しました'
    else
      redirect_to travel_scrap_folders_path(@travel), alert: '削除できませんでした'
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
    params.require(:scrap_folder).permit(:name)
  end
end
