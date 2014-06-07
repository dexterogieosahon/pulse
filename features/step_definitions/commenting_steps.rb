When(/^I view the message "(.*?)"$/) do |message|
  visit message_path(Message.where(content: message).first)
end

When(/^I leave the comment "(.*?)"$/) do |comment|
  fill_in "comment_content", with: comment
  click_button "Comment"
end

Then(/^I should see the comment "(.*?)"$/) do |comment|
  expect(page).to have_content(comment)
end