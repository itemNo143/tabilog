class TravelsController < ApplicationController
  before_action :set_travel, only: %i[show update destroy]

  def index
    if user_signed_in?
      @travel = Travel.new
      @travel.users << current_user
    else
      redirect_to new_user_session_path
    end
  end

  def show
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
    if @travel.update(travel_params)
      redirect_to @travel, notice: 'アルバムを更新しました'
    else
      redirect_to @travel, notice: 'アルバムの更新に失敗しました'
    end
  end

  def destroy
    if @travel.destroy
      redirect_to action: 'index', notice: '削除しました'
    else
      redirect_to action: 'index', alert: '削除できませんでした'
    end
  end

  private

  def set_travel
    @travel = Travel.find(params[:id])
  end

  def travel_params
    params.require(:travel).permit(:name, :start_date, :end_date, :image, :memo, user_ids: [])
  end

end
