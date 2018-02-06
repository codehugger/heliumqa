class EquipmentProfilesController < ApplicationController
  before_action :set_equipment_profile, only: [:show, :edit, :update, :destroy]

  # GET /equipment_profiles
  # GET /equipment_profiles.json
  def index
    @equipment_profiles = current_account.equipment_profiles.all
  end

  # GET /equipment_profiles/1
  # GET /equipment_profiles/1.json
  def show
  end

  # GET /equipment_profiles/new
  def new
    @equipment_profile = current_account.equipment_profiles.new
  end

  # GET /equipment_profiles/1/edit
  def edit
  end

  # POST /equipment_profiles
  # POST /equipment_profiles.json
  def create
    @equipment_profile = current_account.equipment_profiles.new(equipment_profile_params)

    respond_to do |format|
      if @equipment_profile.save
        format.html { redirect_to @equipment_profile, notice: 'Equipment profile was successfully created.' }
        format.json { render :show, status: :created, location: @equipment_profile }
      else
        format.html { render :new }
        format.json { render json: @equipment_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipment_profiles/1
  # PATCH/PUT /equipment_profiles/1.json
  def update
    respond_to do |format|
      if @equipment_profile.update(equipment_profile_params)
        format.html { redirect_to @equipment_profile, notice: 'Equipment profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @equipment_profile }
      else
        format.html { render :edit }
        format.json { render json: @equipment_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment_profiles/1
  # DELETE /equipment_profiles/1.json
  def destroy
    @equipment_profile.destroy
    respond_to do |format|
      format.html { redirect_to equipment_profiles_url, notice: 'Equipment profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment_profile
      @equipment_profile = current_account.equipment_profiles.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipment_profile_params
      params.require(:equipment_profile).permit(:site_id, :name, :profile_data)
    end
end
