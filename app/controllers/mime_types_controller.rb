class MimeTypesController < ApplicationController
  before_action :set_mime_type, only: [:show, :edit, :update, :destroy]

  # GET /mime_types
  # GET /mime_types.json
  def index
    @mime_types = MimeType.all
  end

  # GET /mime_types/1
  # GET /mime_types/1.json
  def show
  end

  # GET /mime_types/new
  def new
    @mime_type = MimeType.new
  end

  # GET /mime_types/1/edit
  def edit
  end

  # POST /mime_types
  # POST /mime_types.json
  def create
    @mime_type = MimeType.new(mime_type_params)

    respond_to do |format|
      if @mime_type.save
        format.html { redirect_to @mime_type, notice: 'Mime type was successfully created.' }
        format.json { render :show, status: :created, location: @mime_type }
      else
        format.html { render :new }
        format.json { render json: @mime_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mime_types/1
  # PATCH/PUT /mime_types/1.json
  def update
    respond_to do |format|
      if @mime_type.update(mime_type_params)
        format.html { redirect_to @mime_type, notice: 'Mime type was successfully updated.' }
        format.json { render :show, status: :ok, location: @mime_type }
      else
        format.html { render :edit }
        format.json { render json: @mime_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mime_types/1
  # DELETE /mime_types/1.json
  def destroy
    @mime_type.destroy
    respond_to do |format|
      format.html { redirect_to mime_types_url, notice: 'Mime type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mime_type
      @mime_type = MimeType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mime_type_params
      params.require(:mime_type).permit(:name, :description)
    end
end
