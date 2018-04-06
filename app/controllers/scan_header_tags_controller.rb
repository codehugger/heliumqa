class ScanHeaderTagsController < ApplicationController
  before_action :set_scan_header_tag, only: [:show, :edit, :update, :destroy]

  # GET /scan_header_tags
  # GET /scan_header_tags.json
  def index
    @scan_header_tags = ScanHeaderTag.all
  end

  # GET /scan_header_tags/1
  # GET /scan_header_tags/1.json
  def show
  end

  # GET /scan_header_tags/new
  def new
    @scan_header_tag = ScanHeaderTag.new
  end

  # GET /scan_header_tags/1/edit
  def edit
  end

  # POST /scan_header_tags
  # POST /scan_header_tags.json
  def create
    @scan_header_tag = ScanHeaderTag.new(scan_header_tag_params)

    respond_to do |format|
      if @scan_header_tag.save
        format.html { redirect_to @scan_header_tag, notice: 'Scan header tag was successfully created.' }
        format.json { render :show, status: :created, location: @scan_header_tag }
      else
        format.html { render :new }
        format.json { render json: @scan_header_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scan_header_tags/1
  # PATCH/PUT /scan_header_tags/1.json
  def update
    respond_to do |format|
      if @scan_header_tag.update(scan_header_tag_params)
        format.html { redirect_to @scan_header_tag, notice: 'Scan header tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @scan_header_tag }
      else
        format.html { render :edit }
        format.json { render json: @scan_header_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scan_header_tags/1
  # DELETE /scan_header_tags/1.json
  def destroy
    @scan_header_tag.destroy
    respond_to do |format|
      format.html { redirect_to scan_header_tags_url, notice: 'Scan header tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scan_header_tag
      @scan_header_tag = ScanHeaderTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scan_header_tag_params
      params.require(:scan_header_tag).permit(:mime_type_id, :key, :label, :value_type)
    end
end
