class ReportsController < ApplicationController
  def show
    @analysis = Analysis.friendly.find(params[:id])
  end
end
