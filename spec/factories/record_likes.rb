FactoryBot.define do
  factory :record_like do
    association :user
    association :record
  end
end
