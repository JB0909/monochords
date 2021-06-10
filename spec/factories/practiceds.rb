FactoryBot.define do
  factory :practiced do
    association :user
    association :music
  end
end
