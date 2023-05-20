# == Schema Information
#
# Table name: patients
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_patients_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Patient < ApplicationRecord
  # Todo colocar dados de Paciente como: cpf, enderenco etec
  has_many :exame
  belongs_to :user
end
