class InspectionFilesController < ApplicationController
  before_action :set_inspection, only: [:index, :new, :create]
  before_action :set_inspection_file, only: [:show, :edit, :update, :destroy]

  # GET /inspection_files
  # GET /inspection_files.json
  def index
    @inspection_files = @inspection.blank? ? InspectionFile.all : @inspection.inspection_files.all
  end

  # GET /inspection_files/1
  # GET /inspection_files/1.json
  def show
  end

  # GET /inspection_files/new
  def new
    @inspection_file = @inspection.inspection_files.new
  end

  # GET /inspection_files/1/edit
  def edit
  end

  # POST /inspection_files
  # POST /inspection_files.json
  def create
    @inspection_file = @inspection.inspection_files.create(inspection_file_params)

    respond_to do |format|
      if @inspection_file.save
        format.html { redirect_to @inspection_file, notice: 'Inspection file was successfully created.' }
        format.json { render :show, status: :created, location: @inspection_file }
      else
        format.html { render :new }
        format.json { render json: @inspection_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inspection_files/1
  # PATCH/PUT /inspection_files/1.json
  def update
    respond_to do |format|
      if @inspection_file.update(inspection_file_params)
        format.html { redirect_to @inspection_file, notice: 'Inspection file was successfully updated.' }
        format.json { render :show, status: :ok, location: @inspection_file }
      else
        format.html { render :edit }
        format.json { render json: @inspection_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inspection_files/1
  # DELETE /inspection_files/1.json
  def destroy
    @inspection = @inspection_file.inspection
    @inspection_file.destroy
    respond_to do |format|
      format.html { redirect_to inspection_url(@inspection), notice: 'Inspection file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inspection_file
      @inspection_file = InspectionFile.find(params[:id])
    end

    def set_inspection
      @inspection = Inspection.find(params[:inspection_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inspection_file_params
      params.require(:inspection_file).permit(:inspection_id, file: {})
    end
end
