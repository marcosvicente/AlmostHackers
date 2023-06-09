# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  avatar                 :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  phone_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  user_type              :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password {"initial123"}
    name { Faker::Name.name}
    trait :admin do
      user_type { :admin }
    end

    trait :doctor do
      user_type { :doctor }
      after(:create) do |user|
        create(:doctor, user: user)
      end
    end

    trait :patient do
      user_type { :patient }
      after(:create) do |user|
        create(:patient, user: user)
      end
    end
  end
end
