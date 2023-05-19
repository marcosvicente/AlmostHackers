# == Schema Information
#
# Table name: patients
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :patient do
    name { Faker::Name.name }
  end
end
