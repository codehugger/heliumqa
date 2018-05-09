class ScanSeriesController < ApplicationController
  # enable streaming responses
  include ActionController::Streaming
  # enable zipline
  include Zipline

  before_action :set_scan_series, only: [:show, :edit, :update, :destroy, :download_files]

  # GET /scan_series
  # GET /scan_series.json
  def index
    @scan_series = ScanSeries.all
  end

  # GET /scan_series/1
  # GET /scan_series/1.json
  def show
  end

  # GET /scan_series/1/edit
  def edit
    session[:previous_url] = request.referrer
  end

  # PATCH/PUT /scan_series/1
  # PATCH/PUT /scan_series/1.json
  def update
    respond_to do |format|
      if @scan_series.update(scan_series_params)
        format.html { redirect_back fallback_location: session[:previous_url], notice: 'Scan series was successfully updated.' }
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
      format.html { redirect_back fallback_location: scan_series_index_url, notice: 'Scan series was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /scan_series/1/download_files
  def download_files
    files = @scan_series.qa_session_files.map { |f| [f.file, f.filename] }
    zipline(files, "#{@scan_series.description}.zip")
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
