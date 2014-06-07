Given(/^I am signed in$/) do
  signin_user
end

Given(/^he creates a message "(.*?)"$/) do |message|
  @otheruser.messages.create(content: message)
end

Given(/^"(.*?)" and I are friends$/) do |name|
  @user.befriend(User.where(name: name).first)
end

When(/^I view my profile$/) do
  click_link "View Profile"
end

Then(/^I should see all messages from my friends$/) do
  expect(page).to have_content("Friend's messages")
  expect(page).to have_content("Off to Germany!")
  expect(page).to have_content("Brew some code, and drink some beer!")
end

When(/^I visit "(.*?)"'s profile$/) do |name|
  visit user_path(User.where(name: name).first)
end

Then(/^I should see all his messages "(.*?)" and "(.*?)"$/) do |message, message2|
  expect(page).to have_content(message)
  expect(page).to have_content(message2)
end

When(/^I create a message "(.*?)"$/) do |message|
  fill_in "message_content", with: message
  click_button "Post"
end

Then(/^I should see the message "(.*?)"$/) do |message|
  expect(page).to have_content(message)
end