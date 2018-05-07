class PhantomModuleFilesController < ApplicationController
  before_action :set_phantom_module_file, only: [:show, :edit, :update, :destroy]

  # GET /phantom_module_files
  # GET /phantom_module_files.json
  def index
    @phantom_module_files = PhantomModuleFile.all
  end

  # GET /phantom_module_files/1
  # GET /phantom_module_files/1.json
  def show
  end

  # GET /phantom_module_files/new
  def new
    @phantom_module_file = PhantomModuleFile.new
  end

  # GET /phantom_module_files/1/edit
  def edit
  end

  # POST /phantom_module_files
  # POST /phantom_module_files.json
  def create
    @phantom_module_file = PhantomModuleFile.new(phantom_module_file_params)

    respond_to do |format|
      if @phantom_module_file.save
        format.html { redirect_to @phantom_module_file, notice: 'Phantom module file was successfully created.' }
        format.json { render :show, status: :created, location: @phantom_module_file }
      else
        format.html { render :new }
        format.json { render json: @phantom_module_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phantom_module_files/1
  # PATCH/PUT /phantom_module_files/1.json
  def update
    respond_to do |format|
      if @phantom_module_file.update(phantom_module_file_params)
        format.html { redirect_to @phantom_module_file, notice: 'Phantom module file was successfully updated.' }
        format.json { render :show, status: :ok, location: @phantom_module_file }
      else
        format.html { render :edit }
        format.json { render json: @phantom_module_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phantom_module_files/1
  # DELETE /phantom_module_files/1.json
  def destroy
    @phantom_module_file.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_url, notice: 'Phantom module file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phantom_module_file
      @phantom_module_file = PhantomModuleFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phantom_module_file_params
      params.fetch(:phantom_module_file, {})
    end
end
