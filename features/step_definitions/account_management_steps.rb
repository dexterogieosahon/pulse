Given(/^I visit Edit Account page$/) do
  visit edit_user_path(@user)
end

When(/^I change my name to "(.*?)"$/) do |name|
  fill_in "Name", with: name
end

When(/^submit my changes$/) do
  click_button "Save changes"
end

Then(/^my name should be "(.*?)"$/) do |name|
  @user.name == name
end
