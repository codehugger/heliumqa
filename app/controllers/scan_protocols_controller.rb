class ScanProtocolsController < ApplicationController
  before_action :set_site, only: [:new, :create]
  before_action :set_scan_protocol, only: [:show, :edit, :update, :destroy, :delete_analysis_options_file, :delete_specifications_file]

  # GET /scan_protocols
  # GET /scan_protocols.json
  def index
    @scan_protocols = current_account.scan_protocols.all
  end

  # GET /scan_protocols/1
  # GET /scan_protocols/1.json
  def show
  end

  # GET /scan_protocols/new
  def new
    @scan_protocol = (@site.blank? ? ScanProtocol : @site.scan_protocols).new
    if params[:qa_session_file_id]
      @qa_session_file = current_account.qa_session_files.find(params[:qa_session_file_id])
      @scan_protocol.name = "#{@qa_session_file.scan_series} -- [GENERATED]"
      @scan_protocol.matchers << @qa_session_file.matchers
    end
  end

  # GET /scan_protocols/1/edit
  def edit
  end

  # POST /scan_protocols
  # POST /scan_protocols.json
  def create
    @scan_protocol = (@site.blank? ? ScanProtocol : @site.scan_protocols).new(scan_protocol_params)

    respond_to do |format|
      if @scan_protocol.save
        format.html { redirect_to @scan_protocol, notice: 'Scan protocol was successfully created.' }
        format.json { render :show, status: :created, location: @scan_protocol }
      else
        format.html { render :new }
        format.json { render json: @scan_protocol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scan_protocols/1
  # PATCH/PUT /scan_protocols/1.json
  def update
    respond_to do |format|
      if @scan_protocol.update(scan_protocol_params)
        format.html { redirect_to @scan_protocol, notice: 'Scan protocol was successfully updated.' }
        format.json { render :show, status: :ok, location: @scan_protocol }
      else
        format.html { render :edit }
        format.json { render json: @scan_protocol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scan_protocols/1
  # DELETE /scan_protocols/1.json
  def destroy
    @scan_protocol.destroy
    respond_to do |format|
      format.html { redirect_to scan_protocols_url, notice: 'Scan protocol was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_specifications_file
    respond_to do |format|
      if @scan_protocol.update(specifications_file: nil)
        format.html { redirect_to @scan_protocol, notice: 'Scan protocol was successfully updated.' }
        format.json { render :show, status: :ok, location: @scan_protocol }
      else
        format.html { render :edit }
        format.json { render json: @scan_protocol.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete_analysis_options_file
    respond_to do |format|
      if @scan_protocol.update(analysis_options_file: nil)
        format.html { redirect_to @scan_protocol, notice: 'Scan protocol was successfully updated.' }
        format.json { render :show, status: :ok, location: @scan_protocol }
      else
        format.html { render :edit }
        format.json { render json: @scan_protocol.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = current_account.sites.find(params[:site_id]) if params[:site_id]
    end

    def set_scan_protocol
      @scan_protocol = current_account.scan_protocols.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scan_protocol_params
      params.require(:scan_protocol).permit(:site_id, :name,
        :analysis_options_file,
        :specifications_file,
        phantom_module_files_attributes: [:id, :file, :_destroy],
        matchers_attributes: [:id, :scan_header_tag_id,
          :value_type_matcher_id, :value, :matcher, :_destroy])
    end
end
