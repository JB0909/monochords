FactoryBot.define do
  factory :comment do
    user { nil }
    micropost { nil }
    record { nil }
    review { nil }
    content { "MyString" }
  end
end
