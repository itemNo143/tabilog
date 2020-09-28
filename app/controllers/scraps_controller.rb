class ScrapsController < ApplicationController
  before_action :set_scrap, only: :destroy
  before_action :set_scrap_folder, only: %i[index create]

  def index
    @travel = Travel.find(@scrap_folder.travel_id)
    @scrap  = Scrap.new
    @scraps = @scrap_folder.scraps
  end

  def create
    @scrap = @scrap_folder.scraps.new(scrap_params)
    if @scrap.save
      respond_to do |format|
        format.html { redirect_to scrap_folder_scraps_path(@scrap_folder), notice: '画像を投稿しました' }
        format.json
      end
    else
      redirect_to scrap_folder_scraps_path(@scrap_folder), notice: '画像の投稿に失敗しました'
    end
  end

  def destroy
    @scrap.destroy
    respond_to do |format|
      format.html { redirect_to scraps_url, notice: 'Scrap was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_scrap
    @scrap = Scrap.find(params[:id])
  end

  def set_scrap_folder
    @scrap_folder = ScrapFolder.find(params[:scrap_folder_id])
  end

  def scrap_params
    params.require(:scrap).permit(:image, :memo).merge(user_id: current_user.id, scrap_folder_id: params[:scrap_folder_id])
  end
end
