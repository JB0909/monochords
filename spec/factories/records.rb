FactoryBot.define do
  factory :record do
    body { "TestText" }
    created_at { 10.minutes.ago }
    association :user

    trait :yesterday do
      body { "yesterday" }
      created_at { 1.day.ago }
    end

    trait :day_before_yesterday do
      body { "day_before_yesterday" }
      created_at { 2.days.ago }
    end

    trait :now do
      body { "now" }
      created_at { Time.zone.now }
    end
  end
end
