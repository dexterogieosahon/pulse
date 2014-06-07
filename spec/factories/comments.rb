FactoryGirl.define do
  factory :comment do |c|
    c.content Faker::Lorem.sentence(3)
    c.association :message
    c.association :user
  end
end