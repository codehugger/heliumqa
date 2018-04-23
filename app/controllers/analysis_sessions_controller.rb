class AnalysisSessionsController < ApplicationController
  before_action :set_qa_session, only: [:index, :new, :create]
  before_action :set_analysis_session, only: [:show, :edit, :update, :destroy]

  # GET /analysis_sessions
  # GET /analysis_sessions.json
  def index
    @analysis_sessions = @qa_session.analysis_sessions.all
  end

  # GET /analysis_sessions/1
  # GET /analysis_sessions/1.json
  def show
  end

  # GET /analysis_sessions/new
  def new
    @analysis_session = @qa_session.analysis_sessions.new
  end

  # GET /analysis_sessions/1/edit
  def edit
  end

  # POST /analysis_sessions
  # POST /analysis_sessions.json
  def create
    @analysis_session = @qa_session.analysis_sessions.new(analysis_session_params)

    respond_to do |format|
      if @analysis_session.save
        format.html { redirect_to @qa_session, notice: 'Analysis session was successfully created.' }
        format.json { render :show, status: :created, location: @analysis_session }
      else
        format.html { render :new }
        format.json { render json: @analysis_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /analysis_sessions/1
  # PATCH/PUT /analysis_sessions/1.json
  def update
    respond_to do |format|
      if @analysis_session.update(analysis_session_params)
        format.html { redirect_to @qa_session, notice: 'Analysis session was successfully updated.' }
        format.json { render :show, status: :ok, location: @analysis_session }
      else
        format.html { render :edit }
        format.json { render json: @analysis_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analysis_sessions/1
  # DELETE /analysis_sessions/1.json
  def destroy
    @analysis_session.destroy
    respond_to do |format|
      format.html { redirect_to analysis_sessions_url, notice: 'Analysis session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qa_session
      @qa_session = current_account.qa_sessions.friendly.find(params[:qa_session_id])
    end

    def set_analysis_session
      @analysis_session = AnalysisSession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def analysis_session_params
      params.fetch(:analysis_session, {})
    end
end
