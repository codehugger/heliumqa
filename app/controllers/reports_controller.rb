class ReportsController < ApplicationController
  def index
    @reports = AnalysisRequest.all
  end

  def show
    @report = AnalysisRequest.friendly.find(params[:id])
  end
end
