Given(/^A User "(.*?)"$/) do |name|
  @otheruser = FactoryGirl.create(:user, name: name, email: "johndoe@johndoe.com")
end

When(/^I block "(.*?)"$/) do |name|
  visit root_url
  click_link "Block #{@otheruser.name}"
end

Then(/^he is not visible on Pulse$/) do
  expect(page).not_to have_content(@otheruser.name)
end