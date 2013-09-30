Given(/^there are peeps that have "(.*?)" written by "(.*?)", "(.*?)" with the username "(.*?)"$/) do |post, created_at, maker_id|
  Peep.create(post: post, created_at: created_at, maker_id: maker_id)
end

When(/^a visitor visits the home page$/) do
  visit('/')
end

Then(/^the "(.*?)" should be displayed$/) do |post|
  expect(page).to have_content(post)
end

Then(/^the "(.*?)" should be displayed$/) do |created_at|
  expect(page).to have_content(created_at)
end



Then(/^the post should match "(.*?)"$/) do |post|
  visit('/')
  expect(page).to have_content(post)
end
