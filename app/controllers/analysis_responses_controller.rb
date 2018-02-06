class AnalysisResponsesController < ApplicationController
  before_action :set_analysis_response, only: [:show, :edit, :update, :destroy]

  # GET /analysis_responses
  # GET /analysis_responses.json
  def index
    @analysis_responses = AnalysisResponse.all
  end

  # GET /analysis_responses/1
  # GET /analysis_responses/1.json
  def show
  end

  # GET /analysis_responses/new
  def new
    @analysis_response = AnalysisResponse.new
  end

  # GET /analysis_responses/1/edit
  def edit
  end

  # POST /analysis_responses
  # POST /analysis_responses.json
  def create
    @analysis_response = AnalysisResponse.new(analysis_response_params)

    respond_to do |format|
      if @analysis_response.save
        format.html { redirect_to @analysis_response, notice: 'Analysis response was successfully created.' }
        format.json { render :show, status: :created, location: @analysis_response }
      else
        format.html { render :new }
        format.json { render json: @analysis_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /analysis_responses/1
  # PATCH/PUT /analysis_responses/1.json
  def update
    respond_to do |format|
      if @analysis_response.update(analysis_response_params)
        format.html { redirect_to @analysis_response, notice: 'Analysis response was successfully updated.' }
        format.json { render :show, status: :ok, location: @analysis_response }
      else
        format.html { render :edit }
        format.json { render json: @analysis_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analysis_responses/1
  # DELETE /analysis_responses/1.json
  def destroy
    @analysis_response.destroy
    respond_to do |format|
      format.html { redirect_to analysis_responses_url, notice: 'Analysis response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analysis_response
      @analysis_response = AnalysisResponse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def analysis_response_params
      params.require(:analysis_response).permit(:analysis_request_id, :response_data)
    end
end