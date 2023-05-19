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
require 'rails_helper'

RSpec.describe Exame, type: :model do
  subject(:exame) { build(:exame) }
  it { is_expected.to belong_to(:patient) }
  it { is_expected.to belong_to(:doctor) }

end
