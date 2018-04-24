class Api::V1::AnalysisResponsesController < ApiController
  before_action :set_analysis_request

  def index
    @analysis_request.analysis_response
  end

  # POST /analysis_responses
  # POST /analysis_responses.json
  def create
    @analysis_response = @analysis_request.build_analysis_response(analysis_response_params)

    respond_to do |format|
      if @analysis_response.save
        format.html { redirect_to @analysis_response, notice: 'Analysis response was successfully created.' }
        format.json { render json: @analysis_response, status: :created, location: @analysis_response }
      else
        format.html { render :new }
        format.json { render json: @analysis_response.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_analysis_request
    @analysis_request = AnalysisRequest.friendly.find(params[:analysis_request_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def analysis_response_params
    params.require(:analysis_response).permit(response_data: {}).tap do |whitelisted|
      whitelisted[:response_data] = params[:analysis_response][:response_data].permit!
    end
  end
end
