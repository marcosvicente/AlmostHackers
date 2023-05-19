FactoryBot.define do
  factory :exame do
    patient { nil }
    doctor { nil }
    description { "MyString" }
  end
end
