class ReportsController < ApplicationController
  def show
    @analysis = Analysis.find(params[:id])
  end
end
