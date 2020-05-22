
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end


def sign_up_user(name, email)
  visit "/users/new"

  fill_in "user[name]", with: name
  fill_in "user[email]", with: email
  click_on "Sign up"
end

def create_event(title, description, event_date = nil)
  visit "/events/new"

  fill_in "event[title]", with: title
  fill_in "event[description]", with: description
  fill_in "event[event_date]", with: event_date if event_date
  click_on "Create Event"
end

def login_user(email)
  visit "/login"
  fill_in "session[email]", with: email
  click_on "Log in"
end

def logout_user
  visit "/logout"
end