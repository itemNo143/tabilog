class ScrapFoldersController < ApplicationController
  before_action :set_scrap_folder, only: [:show, :edit, :update, :destroy]

  # GET /scrap_folders
  # GET /scrap_folders.json
  def index
    @scrap_folders = ScrapFolder.all
  end

  # GET /scrap_folders/1
  # GET /scrap_folders/1.json
  def show
  end

  # GET /scrap_folders/new
  def new
    @scrap_folder = ScrapFolder.new
  end

  # GET /scrap_folders/1/edit
  def edit
  end

  # POST /scrap_folders
  # POST /scrap_folders.json
  def create
    @scrap_folder = ScrapFolder.new(scrap_folder_params)

    respond_to do |format|
      if @scrap_folder.save
        format.html { redirect_to @scrap_folder, notice: 'Scrap folder was successfully created.' }
        format.json { render :show, status: :created, location: @scrap_folder }
      else
        format.html { render :new }
        format.json { render json: @scrap_folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scrap_folders/1
  # PATCH/PUT /scrap_folders/1.json
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

  # DELETE /scrap_folders/1
  # DELETE /scrap_folders/1.json
  def destroy
    @scrap_folder.destroy
    respond_to do |format|
      format.html { redirect_to scrap_folders_url, notice: 'Scrap folder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scrap_folder
      @scrap_folder = ScrapFolder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scrap_folder_params
      params.fetch(:scrap_folder, {})
    end
end
