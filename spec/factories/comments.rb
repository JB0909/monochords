FactoryBot.define do
  factory :comment do
    content { "Comment Test" }
    association :user
    association :micropost
  end
end
