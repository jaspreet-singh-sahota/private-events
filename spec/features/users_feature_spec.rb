require 'rails_helper'

feature 'Sign up, login and logout', type: :feature do
  feature 'Create a new User' do
    ## create event and check event show page

    ## login and create event

    scenario 'Sign up with invalid params' do
      sign_up_user('test user', nil)

      expect(current_path).to eq('/users')
      expect(page).to have_content('errors prohibited this user from being saved')
      expect(page).to have_content("Email can't be blank")
    end

    scenario 'Sign up with valid params' do
      sign_up_user('test user', 'test@gmail.com')

      expect(current_path).to eq('/')
      expect(page).to have_content('User was successfully created and logged in')
    end

    scenario 'Log in with valid params' do
      sign_up_user('test user', 'test@gmail.com')
      logout_user
      login_user('test@gmail.com')
      expect(current_path).to eq('/')
      expect(page).to have_content('User logged in successfully')
    end
  end
end
