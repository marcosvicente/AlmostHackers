FactoryBot.create(
  :user,
  email: 'marcos@email.com', 
  password: 'initial123', 
  password_confirmation: 'initial123',
  user_type: :admin
)


doctor_user = FactoryBot.create(
  :user,
  email: 'doctor@email.com', 
  password: 'initial123', 
  password_confirmation: 'initial123',
  user_type: :doctor
)

doctor = FactoryBot.create(
  :doctor,
  user: doctor_user
)

patient_user = FactoryBot.create(
  :user,
  email: 'paciente@email.com', 
  password: 'initial123', 
  password_confirmation: 'initial123',
  user_type: :patient
)

patient = FactoryBot.create(
  :patient,
  user: patient_user
)

# Exames
FactoryBot.create_list(
  :exame,
  10,
  patient: patient,
  doctor: doctor
)
