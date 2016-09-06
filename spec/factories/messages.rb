FactoryGirl.define do
  factory :message do
    user
    content { Faker::Lorem.sentence(10)[0..139] }
  end

  trait :too_long do
    content Faker::Lorem.characters(141)
  end
end
