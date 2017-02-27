require 'rails_helper'

feature 'user logs in' do
  context 'appropriate login' do
    scenario 'user logs in and is taken to their dashboard' do
      user = User.create(email: 'test@test.com',
                  password: 'password',
                  password_confirmation: 'password')

      visit login_path

      fill_in "session[email]", with: "test@test.com"
      fill_in "session[password]", with: "password"
      click_button 'Login'

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content("Logged in as #{user.email}")
      expect(page).to_not have_link('Login')
      expect(page).to have_link('Logout')

      within('#user_information') do
        expect(page).to have_content('Your Account Information')
        expect(page).to have_content('Email Address: test@test.com')
        expect(page).to have_link('Your Order History')
      end

    end
  end
  context 'inappropriate login' do
    scenario 'with incorrect information the user remains at login' do
         user = User.create(email: 'test@test.com',
                  password: 'password',
                  password_confirmation: 'password')

      visit login_path

      fill_in "session[email]", with: "test@test.com"
      fill_in "session[password]", with: "forgot_password"
      click_button 'Login'

      expect(current_path).to eq(login_path)
      expect(page).to have_content('Invalid Credentials')
    end
  end
end
