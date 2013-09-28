Given(/^there are peeps that have "(.*?)" written by "(.*?)", "(.*?)" with the username "(.*?)"$/) do |post, created_at, maker_id|
  Peep.create(post: post, created_at: created_at, maker_id: maker_id)
end

When(/^a visitor visits the home page$/) do
  visit('/')
end

Then(/^the "(.*?)" should be displayed$/) do |post|
  expect(page).to have_content(post)
end

Then(/^the "(.*?)" should be displayed next to the name$/) do |username|
  expect(page).to have_content(username)
end

Given(/^that a peep has been created$/) do
  Peep.create(post: post, created_at: '2013:00:00:00', maker_id: maker_id)
  expect(Peep.first(username:)).to be_an_instance_of Peep
# visit('/')
end


Then(/^the post should match "(.*?)"$/) do |post|
  visit('/')
  expect(page).to have_content(post)
end

Then(/^the username should match "(.*?)"$/) do |username|
  pending # express the regexp above with the code you wish you had
end