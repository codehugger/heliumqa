class AnalysisRequestsController < ApplicationController
  before_action :set_analysis_request, only: [:show, :edit, :update, :destroy]

  # GET /analysis_requests
  # GET /analysis_requests.json
  def index
    @analysis_requests = AnalysisRequest.all
  end

  # GET /analysis_requests/1
  # GET /analysis_requests/1.json
  def show
  end

  # GET /analysis_requests/new
  def new
    @analysis_request = AnalysisRequest.new
  end

  # GET /analysis_requests/1/edit
  def edit
  end

  # POST /analysis_requests
  # POST /analysis_requests.json
  def create
    @analysis_request = AnalysisRequest.new(analysis_request_params)

    respond_to do |format|
      if @analysis_request.save
        format.html { redirect_to @analysis_request, notice: 'Analysis request was successfully created.' }
        format.json { render :show, status: :created, location: @analysis_request }
      else
        format.html { render :new }
        format.json { render json: @analysis_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /analysis_requests/1
  # PATCH/PUT /analysis_requests/1.json
  def update
    respond_to do |format|
      if @analysis_request.update(analysis_request_params)
        format.html { redirect_to @analysis_request, notice: 'Analysis request was successfully updated.' }
        format.json { render :show, status: :ok, location: @analysis_request }
      else
        format.html { render :edit }
        format.json { render json: @analysis_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analysis_requests/1
  # DELETE /analysis_requests/1.json
  def destroy
    @analysis_request.destroy
    respond_to do |format|
      format.html { redirect_to analysis_requests_url, notice: 'Analysis request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analysis_request
      @analysis_request = AnalysisRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def analysis_request_params
      params.require(:analysis_request).permit(:analysis_id, :equipment_profile_id)
    end
end
