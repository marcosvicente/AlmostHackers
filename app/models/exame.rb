# == Schema Information
#
# Table name: exames
#
#  id          :bigint           not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  doctor_id   :bigint           not null
#  patient_id  :bigint           not null
#
# Indexes
#
#  index_exames_on_doctor_id   (doctor_id)
#  index_exames_on_patient_id  (patient_id)
#
# Foreign Keys
#
#  fk_rails_...  (doctor_id => doctors.id)
#  fk_rails_...  (patient_id => patients.id)
#
class Exame < ApplicationRecord
  # TODO: Proibir delete

  belongs_to :patient
  belongs_to :doctor
end
