# == Schema Information
#
# Table name: hospitals
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :hospital do
    name { Faker::Company.name  }
  end
end
