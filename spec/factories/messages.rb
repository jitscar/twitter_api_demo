FactoryGirl.define do
  factory :message do
    user_id 1
    content Faker::Lorem.characters(140)
  end
end
