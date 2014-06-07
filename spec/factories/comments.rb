FactoryGirl.define do
  factory :comment do |c|
    c.content "MyString"
    c.association :message
    c.association :user
  end
end