# == Schema Information
#
# Table name: doctors
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :doctor do
    name { Faker::Name.name }
  end
end
