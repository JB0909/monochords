FactoryBot.define do
  factory :practicing do
    association :user
    association :music
  end
end
