class AnalysesController < ApplicationController
  before_action :set_inspection, only: [:new, :create]
  before_action :set_analysis, only: [:show, :edit, :update, :destroy]

  # GET /analyses
  # GET /analyses.json
  def index
    @analyses = current_account.analyses.all
  end

  # GET /analyses/1
  # GET /analyses/1.json
  def show
  end

  # GET /analyses/new
  def new
    @analysis = @inspection.analyses.new
  end

  # POST /analyses
  # POST /analyses.json
  def create
    @analysis = @inspection.analyses.new

    respond_to do |format|
      if @analysis.save
        format.html { redirect_back fallback_location: @analysis, notice: 'Analysis was successfully requested.' }
        format.json { render :show, status: :created, location: @analysis }
      else
        format.html { render :new }
        format.json { render json: @analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analyses/1
  # DELETE /analyses/1.json
  def destroy
    @inspection = @analysis.inspection
    @analysis.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: @inspection, notice: 'Analysis was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inspection
      @inspection = current_account.inspections.friendly.find(params[:inspection_id])
    end

    def set_analysis
      @analysis = current_account.analyses.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def analysis_params
    end
end
