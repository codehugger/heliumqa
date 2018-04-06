class ScanSeriesController < ApplicationController
  before_action :set_scan_series, only: [:show, :edit, :update, :destroy]

  # GET /scan_series
  # GET /scan_series.json
  def index
    @scan_series = ScanSeries.all
  end

  # GET /scan_series/1
  # GET /scan_series/1.json
  def show
  end

  # GET /scan_series/new
  def new
    @scan_series = ScanSeries.new
  end

  # GET /scan_series/1/edit
  def edit
  end

  # POST /scan_series
  # POST /scan_series.json
  def create
    @scan_series = ScanSeries.new(scan_series_params)

    respond_to do |format|
      if @scan_series.save
        format.html { redirect_to @scan_series, notice: 'Scan series was successfully created.' }
        format.json { render :show, status: :created, location: @scan_series }
      else
        format.html { render :new }
        format.json { render json: @scan_series.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scan_series/1
  # PATCH/PUT /scan_series/1.json
  def update
    respond_to do |format|
      if @scan_series.update(scan_series_params)
        format.html { redirect_to @scan_series, notice: 'Scan series was successfully updated.' }
        format.json { render :show, status: :ok, location: @scan_series }
      else
        format.html { render :edit }
        format.json { render json: @scan_series.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scan_series/1
  # DELETE /scan_series/1.json
  def destroy
    @scan_series.destroy
    respond_to do |format|
      format.html { redirect_to scan_series_index_url, notice: 'Scan series was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scan_series
      @scan_series = ScanSeries.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scan_series_params
      params.require(:scan_series).permit(:key)
    end
end
