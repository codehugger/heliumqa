class AnalysisRequestFilesController < ApplicationController
  before_action :set_analysis_request_file, only: [:show, :edit, :update, :destroy]

  # GET /analysis_request_files
  # GET /analysis_request_files.json
  def index
    @analysis_request_files = AnalysisRequestFile.all
  end

  # GET /analysis_request_files/1
  # GET /analysis_request_files/1.json
  def show
  end

  # GET /analysis_request_files/new
  def new
    @analysis_request_file = AnalysisRequestFile.new
  end

  # GET /analysis_request_files/1/edit
  def edit
  end

  # POST /analysis_request_files
  # POST /analysis_request_files.json
  def create
    @analysis_request_file = AnalysisRequestFile.new(analysis_request_file_params)

    respond_to do |format|
      if @analysis_request_file.save
        format.html { redirect_to @analysis_request_file, notice: 'Analysis request file was successfully created.' }
        format.json { render :show, status: :created, location: @analysis_request_file }
      else
        format.html { render :new }
        format.json { render json: @analysis_request_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /analysis_request_files/1
  # PATCH/PUT /analysis_request_files/1.json
  def update
    respond_to do |format|
      if @analysis_request_file.update(analysis_request_file_params)
        format.html { redirect_to @analysis_request_file, notice: 'Analysis request file was successfully updated.' }
        format.json { render :show, status: :ok, location: @analysis_request_file }
      else
        format.html { render :edit }
        format.json { render json: @analysis_request_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analysis_request_files/1
  # DELETE /analysis_request_files/1.json
  def destroy
    @analysis_request_file.destroy
    respond_to do |format|
      format.html { redirect_to analysis_request_files_url, notice: 'Analysis request file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analysis_request_file
      @analysis_request_file = AnalysisRequestFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def analysis_request_file_params
      params.require(:analysis_request_file).permit(:analysis_request_id, :inspection_file_id)
    end
end
