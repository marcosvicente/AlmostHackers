class ExameService
  def initialize(user)
    @user = user
  end

  def call
    if @user.patient?
      get_exame_from_doctor
    elsif @user.doctor?
      get_exame_from_patient
    else
      return { message: "Error not found type user", status: 401 }
    end
  end

  def get_exame_from_doctor
    Exame.where(patient: @user.patient)
  end

  def get_exame_from_patient
    Exame.where(doctor: @user.doctor)
  end 
end