require 'rails_helper'

feature 'Events features', type: :feature do
  scenario 'display events show page at root' do
    visit '/'
    expect(page).to have_content('Events Management')
    expect(page).to have_content('Title of a longer featured blog post')
  end

  scenario 'test create event without login' do
    visit '/events/new'

    expect(current_path).to eq('/login')
    expect(page).to have_content('You must be logged in to perform that action')
  end

  feature 'After login' do
    before(:example) do
      sign_up_user('test user', 'test@gmail.com')
    end

    scenario 'open create event page after login / sign up' do
      visit '/events/new'

      expect(current_path).to eq('/events/new')
      expect(page).to have_content('Create Event')
    end

    scenario 'create event after login / sign up' do
      visit '/events/new'

      create_event('test title', 'test description')
      expect(page).to have_content('Event was successfully created.')
      expect(page).to have_content('Title: test title')
    end
  end
end
