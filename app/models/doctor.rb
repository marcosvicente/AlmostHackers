# == Schema Information
#
# Table name: doctors
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_doctors_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Doctor < ApplicationRecord
  # Todo colocar dados de Medico como: crm
  has_many :exame
  belongs_to :user
end
