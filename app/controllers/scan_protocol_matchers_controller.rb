class ScanProtocolMatchersController < ApplicationController
  before_action :set_scan_protocol, only: [:index, :new, :create]
  before_action :set_matcher, only: [:show, :edit, :update, :destroy]
  before_action :decoreate_scan_protocol_matcher, only: [:show, :edit]

  # GET /scan_protocol_matchers
  # GET /scan_protocol_matchers.json
  def index
    @scan_protocol_matchers = @scan_protocol.matchers.all.decorate
  end

  # GET /scan_protocol_matchers/1
  # GET /scan_protocol_matchers/1.json
  def show
  end

  # GET /scan_protocol_matchers/new
  def new
    @scan_protocol_matcher = @scan_protocol.matchers.new
  end

  # GET /scan_protocol_matchers/1/edit
  def edit
  end

  # POST /scan_protocol_matchers
  # POST /scan_protocol_matchers.json
  def create
    @scan_protocol_matcher = @scan_protocol.matchers.new(_params)

    respond_to do |format|
      if @scan_protocol_matcher.save
        format.html { redirect_to @scan_protocol_matcher.scan_protocol, notice: 'Scan protocol matcher was successfully created.' }
        format.json { render :show, status: :created, location: @scan_protocol_matcher }
      else
        format.html { render :new }
        format.json { render json: @scan_protocol_matcher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scan_protocol_matchers/1
  # PATCH/PUT /scan_protocol_matchers/1.json
  def update
    respond_to do |format|
      if @scan_protocol_matcher.update(_params)
        format.html { redirect_to @scan_protocol_matcher.scan_protocol, notice: 'Scan protocol matcher was successfully updated.' }
        format.json { render :show, status: :ok, location: @scan_protocol_matcher }
      else
        format.html { render :edit }
        format.json { render json: @scan_protocol_matcher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scan_protocol_matchers/1
  # DELETE /scan_protocol_matchers/1.json
  def destroy
    @scan_protocol = @scan_protocol_matcher.scan_protocol
    @scan_protocol_matcher.destroy
    respond_to do |format|
      format.html { redirect_to @scan_protocol, notice: 'Matcher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scan_protocol
      @scan_protocol = current_account.scan_protocols.find(params[:scan_protocol_id])
    end

    def set_matcher
      @scan_protocol_matcher = (@scan_protocol || current_account).matchers.find(params[:id])
    end

    def decoreate_scan_protocol_matcher
      @scan_protocol_matcher = @scan_protocol_matcher.decorate
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def _params
      params.require(:scan_protocol_matcher).permit(
        :scan_header_tag_id,
        :value_type_matcher_id,
        :value
      )
    end
end
