FactoryGirl.define do
  factory :user do
    name "Name McName"
    username "uzername"
    uid "1234"
    provider "Twitch"
    email "fake@email.com"
    token "12345678890"
  end
end
