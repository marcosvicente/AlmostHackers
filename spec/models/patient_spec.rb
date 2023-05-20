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
require 'rails_helper'

RSpec.describe Patient, type: :model do
  subject(:patient) { build(:patient) }
  it { is_expected.to have_many(:exame) }
  it { is_expected.to belong_to(:user) }
end
