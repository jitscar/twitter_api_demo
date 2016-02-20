FactoryGirl.define do
  factory :message do
    user
    content Faker::Lorem.characters(140)
  end

  trait :too_long do
    content Faker::Lorem.characters(141)
  end
end
