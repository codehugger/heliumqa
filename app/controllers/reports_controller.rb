class ReportsController < ApplicationController
  def index
    @reports = AnalysisRequest.all
  end

  def show
    @report = AnalysisResponse.friendly.find(params[:id])
  end
end
