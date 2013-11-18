Given(/^I am an unregisted user$/) do
  @user = :guest
end

When(/^I go to "(.*?)" page$/) do |url|
  visit url
end

Then(/^I should see a logo$/) do
  page.should have_selector("#logo")
end

Then(/^I should see a menu$/) do
  page.should have_selector("#menu")
end

Then(/^I should see a search text$/) do
  page.should have_field("search_field")
end

Then(/^I should see some Activities$/) do
  page.should have_selector("#activities")
end

Then(/^I should see intro text$/) do
  page.should have_selector("#intro")
end

Then(/^I should see sign up box$/) do
  page.should have_selector("#sign_up")
end

Then(/^I should see a footer$/) do
  page.should have_selector("#footer", text: /There\'s more than one way to do it/)
end
