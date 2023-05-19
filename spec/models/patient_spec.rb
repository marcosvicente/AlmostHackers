# == Schema Information
#
# Table name: patients
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Patient, type: :model do
  subject(:patient) { build(:patient) }
  it { is_expected.to have_many(:exame) }
  it { is_expected.to validate_presence_of(:name) }
end
