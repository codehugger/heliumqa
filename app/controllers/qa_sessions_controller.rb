class QaSessionsController < ApplicationController
  # enable streaming responses
  include ActionController::Streaming
  # enable zipline
  include Zipline

  before_action :set_qa_session, only: [:show, :edit, :update, :destroy, :download_files, :match_scan_protocols]
  before_action :redirect_to_unfinalized, only: [:new, :create]

  # GET /qa_sessions
  # GET /qa_sessions.json
  def index
    @qa_sessions = current_account.qa_sessions.all.order(performed_at: :desc)
  end

  # GET /qa_sessions/1
  # GET /qa_sessions/1.json
  def show
  end

  # GET /qa_sessions/new
  def new
    @qa_session = current_account.qa_sessions.new
    @qa_session.performed_at = Time.now.to_date.to_s(:db)
  end

  # GET /qa_sessions/1/edit
  def edit
  end

  # POST /qa_sessions
  # POST /qa_sessions.json
  def create
    @qa_session = current_account.qa_sessions.new
    @qa_session.assign_attributes(qa_session_params)

    respond_to do |format|
      if @qa_session.save
        format.html { redirect_to @qa_session, notice: 'QA session was successfully created.' }
        format.json { render :show, status: :created, location: @qa_session }
      else
        format.html { render :new }
        format.json { render json: @qa_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qa_sessions/1
  # PATCH/PUT /qa_sessions/1.json
  def update
    respond_to do |format|
      if @qa_session.update(qa_session_params)
        format.html { redirect_to @qa_session, notice: 'QA session was successfully updated.' }
        format.json { render :show, status: :ok, location: @qa_session }
      else
        format.html { render :edit }
        format.json { render json: @qa_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qa_sessions/1
  # DELETE /qa_sessions/1.json
  def destroy
    @qa_session.destroy
    respond_to do |format|
      format.html { redirect_to qa_sessions_url, notice: 'QA session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /qa_sessions/1/match_scan_protocols
  def match_scan_protocols
    @qa_session.qa_session_files.each { |f| f.match_scan_protocol(force: true); f.save }
    redirect_to @qa_session, notice: 'qa_session files successfully re-analyzed.'
  end

  # GET /qa_sessions/1/download_files
  def download_files
    files = @qa_session.qa_session_files.map { |f| [f.file, f.original_filename] }
    zipline(files, "#{@qa_session.key}.zip")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qa_session
      @qa_session = current_account.qa_sessions.friendly.find(params[:id])
    end

    def set_equipment
      @equipment = current_account.equipment.find(params[:equipment_id]) if params[:equipment_id]
    end

    def redirect_to_unfinalized
      @qa_session = current_account.qa_sessions.unfinalized.first
      unless @qa_session.blank?
        respond_to do |format|
          format.html { redirect_to @qa_session }
          format.json { render :show, status: :ok, location: @qa_session }
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qa_session_params
      params.fetch(:qa_session, {}).permit(:equipment_id, :performed_at)
    end
end
