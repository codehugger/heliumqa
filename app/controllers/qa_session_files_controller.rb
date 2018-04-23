class QaSessionFilesController < ApplicationController
  before_action :set_qa_session, only: [:index, :new, :create]
  before_action :set_qa_session_file, only: [:show, :edit, :update, :destroy]

  # GET /qa_session_files
  # GET /qa_session_files.json
  def index
    @qa_session_files = @qa_session.blank? ? qa_sessionFile.all : @qa_session.qa_session_files.all
  end

  # GET /qa_session_files/1
  # GET /qa_session_files/1.json
  def show
  end

  # GET /qa_session_files/new
  def new
    @qa_session_file = @qa_session.qa_session_files.new
  end

  # GET /qa_session_files/1/edit
  def edit
  end

  # POST /qa_session_files
  # POST /qa_session_files.json
  def create
    @qa_session_file = @qa_session.qa_session_files.create(qa_session_file_params)

    respond_to do |format|
      if @qa_session_file.save
        format.html { redirect_to @qa_session_file, notice: 'qa_session file was successfully created.' }
        format.json { render :show, status: :created, location: @qa_session_file }
      else
        format.html { render :new }
        format.json { render json: @qa_session_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qa_session_files/1
  # PATCH/PUT /qa_session_files/1.json
  def update
    respond_to do |format|
      if @qa_session_file.update(qa_session_file_params)
        format.html { redirect_to @qa_session_file, notice: 'qa_session file was successfully updated.' }
        format.json { render :show, status: :ok, location: @qa_session_file }
      else
        format.html { render :edit }
        format.json { render json: @qa_session_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qa_session_files/1
  # DELETE /qa_session_files/1.json
  def destroy
    @qa_session = @qa_session_file.qa_session
    @qa_session_file.destroy
    respond_to do |format|
      format.html { redirect_to qa_session_url(@qa_session), notice: 'qa_session file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qa_session_file
      @qa_session_file = current_account.qa_session_files.friendly.find(params[:id])
    end

    def set_qa_session
      @qa_session = current_account.qa_sessions.friendly.find(params[:qa_session_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qa_session_file_params
      params.require(:qa_session_file).permit(:qa_session_id, file: {}) do |whitelisted|
        whitelisted[:file] = params[:qa_session_file][:file].permit!
      end
    end
end
