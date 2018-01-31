class AnalysisResponseFilesController < ApplicationController
  before_action :set_analysis_response_file, only: [:show, :edit, :update, :destroy]

  # GET /analysis_response_files
  # GET /analysis_response_files.json
  def index
    @analysis_response_files = AnalysisResponseFile.all
  end

  # GET /analysis_response_files/1
  # GET /analysis_response_files/1.json
  def show
  end

  # GET /analysis_response_files/new
  def new
    @analysis_response_file = AnalysisResponseFile.new
  end

  # GET /analysis_response_files/1/edit
  def edit
  end

  # POST /analysis_response_files
  # POST /analysis_response_files.json
  def create
    @analysis_response_file = AnalysisResponseFile.new(analysis_response_file_params)

    respond_to do |format|
      if @analysis_response_file.save
        format.html { redirect_to @analysis_response_file, notice: 'Analysis response file was successfully created.' }
        format.json { render :show, status: :created, location: @analysis_response_file }
      else
        format.html { render :new }
        format.json { render json: @analysis_response_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /analysis_response_files/1
  # PATCH/PUT /analysis_response_files/1.json
  def update
    respond_to do |format|
      if @analysis_response_file.update(analysis_response_file_params)
        format.html { redirect_to @analysis_response_file, notice: 'Analysis response file was successfully updated.' }
        format.json { render :show, status: :ok, location: @analysis_response_file }
      else
        format.html { render :edit }
        format.json { render json: @analysis_response_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analysis_response_files/1
  # DELETE /analysis_response_files/1.json
  def destroy
    @analysis_response_file.destroy
    respond_to do |format|
      format.html { redirect_to analysis_response_files_url, notice: 'Analysis response file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analysis_response_file
      @analysis_response_file = AnalysisResponseFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def analysis_response_file_params
      params.require(:analysis_response_file).permit(:analysis_response_id, :file_data)
    end
end
