FactoryBot.define do
  factory :wish do
    association :user
    association :music
  end
end
