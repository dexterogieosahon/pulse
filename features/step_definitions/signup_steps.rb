Given(/^I visit the home page$/) do
  visit root_path
end

When(/^I sign up$/) do
  click_link "Sign up"
  fill_in "Email", with: "testuser@example.com"
  fill_in "Password", with: "temptemp"
  fill_in "Password Confirmation", with: "temptemp"
  click_button "Create account"
end

Then(/^I should have an account$/) do
  User.exists?(email: "testuser@example.com}")
end
