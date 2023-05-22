class ExamesController < ApplicationController
  before_action :authenticate_user!
  before_action :only_doctor_user_resource, only: [:new, :edit]
  before_action :only_patient_and_doctor_user_resource, only: [:index]
  before_action :patient_select_array, only: [:edit, :new]
  before_action :set_exame, only: [:edit, :update]

   # GET / || GET /exame
   def index
    @exames = ExameService.new(current_user).call
  end


   # GET /exames/new
  def new
    @exame = Exame.new
  end

  # GET /exames/1/edit
  def edit
  end

  # POST /exames
  def create
    @exame = Exame.new(exame_params)
    @exame.doctor = current_user.doctor
    if @exame.save
      redirect_to root_path, notice: "Exame was created successfully."
    else
      render :new, status: :unprocessable_entity 
    end
  end

   # POST /exames
   def update
    if @exame.update(exame_update_params)
     redirect_to root_path, notice: "Exame was updated successfully ."
    else
     render :edit, status: :unprocessable_entity 
    end
  end

  private
  def set_exame
    @exame = Exame.find(params[:id])
  end

  def exame_params
    params.require(:exame).permit(
      :patient_id,
      :description
    )
  end
  
  def exame_update_params
    params.require(:exame).permit(
      :description
    )
  end

  def patient_select_array
    @patient_select_array = Patient.includes(:user).collect{|patient| [patient.user.name, patient.id]}
  end
end
