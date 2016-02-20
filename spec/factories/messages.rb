FactoryGirl.define do
  factory :message do
    user
    content Faker::Lorem.characters(140)
  end
end
