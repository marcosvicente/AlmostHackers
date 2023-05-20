FactoryBot.create(
  :user,
  email: 'marcos@email.com', 
  password: 'initial123', 
  password_confirmation: 'initial123',
  user_type: :admin
)


FactoryBot.create(
  :user,
  email: 'medico@email.com', 
  password: 'initial123', 
  password_confirmation: 'initial123',
  user_type: :admin
)

FactoryBot.create(
  :user,
  email: 'paciente@email.com', 
  password: 'initial123', 
  password_confirmation: 'initial123',
  user_type: :admin
)