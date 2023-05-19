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
FactoryBot.define do
  factory :exame do
    patient { nil }
    doctor { nil }
    description { Faker::Lorem.word }
  end
end
