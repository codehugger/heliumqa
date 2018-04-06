class InspectionsController < ApplicationController
  # enable streaming responses
  include ActionController::Streaming
  # enable zipline
  include Zipline

  before_action :set_equipment, only: [:new]
  before_action :set_inspection, only: [:show, :edit, :update, :destroy, :download_files, :match_scan_protocols]

  # GET /inspections
  # GET /inspections.json
  def index
    @inspections = Inspection.all.order(performed_at: :desc)
  end

  # GET /inspections/1
  # GET /inspections/1.json
  def show
  end

  # GET /inspections/new
  def new
    @inspection = @equipment.blank? ? Inspection.new : @equipment.inspections.new
    @inspection.performed_at = Time.now.to_date.to_s(:db)
  end

  # GET /inspections/1/edit
  def edit
  end

  # POST /inspections
  # POST /inspections.json
  def create
    @inspection = @equipment.blank? ? Inspection.new : @equipment.inspections.new
    @inspection.assign_attributes(inspection_params)

    respond_to do |format|
      if @inspection.save
        format.html { redirect_to @inspection, notice: 'Inspection was successfully created.' }
        format.json { render :show, status: :created, location: @inspection }
      else
        format.html { render :new }
        format.json { render json: @inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inspections/1
  # PATCH/PUT /inspections/1.json
  def update
    respond_to do |format|
      if @inspection.update(inspection_params)
        format.html { redirect_to @inspection, notice: 'Inspection was successfully updated.' }
        format.json { render :show, status: :ok, location: @inspection }
      else
        format.html { render :edit }
        format.json { render json: @inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inspections/1
  # DELETE /inspections/1.json
  def destroy
    @inspection.destroy
    respond_to do |format|
      format.html { redirect_to inspections_url, notice: 'Inspection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /inspections/1/match_scan_protocols
  def match_scan_protocols
    @inspection.inspection_files.each { |f| f.match_scan_protocol(force: true); f.save }
    redirect_to @inspection, notice: 'Inspection files successfully re-analyzed.'
  end

  # GET /inspections/1/download_files
  def download_files
    files = @inspection.inspection_files.map { |f| [f.file, f.original_filename] }
    zipline(files, "#{@inspection.key}.zip")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inspection
      @inspection = current_account.inspections.friendly.find(params[:id])
    end

    def set_equipment
      @equipment = current_account.equipment.find(params[:equipment_id]) if params[:equipment_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inspection_params
      params.require(:inspection).permit(:equipment_id, :performed_at)
    end
end
