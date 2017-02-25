require 'rails_helper'

describe 'as a user' do
  describe 'when I visit /admin/dashboard' do
    it 'I will see a 404 message' do

      admin = User.create(email: 'user@user.com',
                          password: 'password',
                          role: 0)

      visit login_path

      fill_in "session[email]", with: "user@user.com"
      fill_in "session[password]", with: "password"
      click_button 'Login'

      visit 'admin/dashboard'

      expect(page).to_not have_content("Admin Dashboard")

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
