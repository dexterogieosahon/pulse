FactoryGirl.define do
  factory :message do |m|
    m.association :user
    m.content Faker::Lorem.sentence(3)
  end
end
