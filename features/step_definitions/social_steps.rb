When(/^I request to befriend "(.*?)"$/) do |name|
  visit root_path
  click_link  "Befriend #{@otheruser.name}"
end

Then(/^we should be friends$/) do
  expect(page).to_not have_content("Befriend #{@otheruser.name}")
  expect(page).to have_content("Breakup with #{@otheruser.name}")

  expect(@user.friends_with?(@otheruser)).to be true
  expect(@otheruser.friends_with?(@user)).to be true
  expect(@user.friends.count).to be 1
  expect(@otheruser.friends.count).to be 1
end

When(/^I view my friend list$/) do
  click_link "View Profile"
  expect(page).to have_content("Friend list")
  expect(page).to have_content("Breakup with #{@otheruser.name}")
end

When(/^I demand to breakup with him$/) do
  click_link "Breakup with #{@otheruser.name}"
end

Then(/^we are no longer friends$/) do
  expect(page).to_not have_content(@otheruser.name)
  expect(@user.friends_with?(@otheruser)).to be false
  expect(@otheruser.friends_with?(@user)).to be false
end