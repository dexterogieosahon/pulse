Given(/^I visit the sign in page$/) do
  visit signin_path
end

Given(/^I supply invalid credentials$/) do
  fill_in "Email",    with: "sample@example.com"
  fill_in "Password", with: "secret"
end

When(/^I Sign in$/) do
  click_button "Sign in"
end

Then(/^I should see error messages$/) do
  expect(page).to have_content('Invalid email/password')
end

Given(/^I supply valid credentials$/) do
  @user = FactoryGirl.create(:user)
  fill_in "Email",    with: @user.email
  fill_in "Password", with: "notsosecret"
end

Then(/^I should be successful$/) do
  expect(page).to have_link('Sign out', href: signout_path)
end

def signin_user
  visit signin_path
  @user = FactoryGirl.create(:user)
  fill_in "Email",    with: @user.email
  fill_in "Password", with: "notsosecret"
  click_button "Sign in"
  expect(page).to have_link('Sign out', href: signout_path)
end