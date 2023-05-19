# == Schema Information
#
# Table name: hospitals
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Hospital, type: :model do
  subject(:hospital) { build(:hospital) }
  it { is_expected.to have_and_belong_to_many(:user) }

  it { is_expected.to validate_presence_of(:name) }
end
