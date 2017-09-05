FactoryGirl.define do
  factory :message do
    content Faker::Hacker.say_something_smart
  end
end
