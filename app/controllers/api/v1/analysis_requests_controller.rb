class Api::V1::AnalysisRequestsController < ApiController
  def index
    @analysis_requests = AnalysisRequest.without_response
  end

  def show
    @analysis_request = AnalysisRequest.friendly.find(params[:id])
  end
end
