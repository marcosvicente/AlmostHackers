class ApplicationController < ActionController::Base
  load_and_authorize_resource if: lambda { |controller| [:problems, :analyses].include? controller.controller_name.to_sym }
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |_e|
    unauthorized_error!
  end

  private
  def only_admin_user_resource
    return true if current_user&.admin?
    unauthorized_error!
  end

  def only_doctor_user_resource
    return true if current_user&.doctor?
    unauthorized_error!
  end

  def only_patient_user_resource
    return true if current_user&.patient?
    unauthorized_error!
  end

  def only_patient_and_doctor_user_resource
    return true if current_user&.patient? || current_user&.doctor?
    unauthorized_error!
  end


  def unauthorized_error!
    render :file => "public/401.html", :status => :unauthorized
  end
end
