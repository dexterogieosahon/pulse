FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    password "notsosecret"
    password_confirmation "notsosecret"
  end
end