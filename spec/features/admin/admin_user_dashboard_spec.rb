require 'rails_helper'

describe 'as an Admin' do
  describe 'when I visit /admin/dashboard' do
    it 'I will see the Admin Dashboard Page' do

      admin = User.create(email: 'admin@admin.com',
                          password: 'password',
                          password_confirmation: 'password',
                          first_name: 'First Test',
                          last_name: 'Last Test',
                          street: '123 Test St',
                          city: 'Test City',
                          state: 'Test State',
                          zip: '12345',
                          role: 1)

      visit login_path

      fill_in "session[email]", with: "admin@admin.com"
      fill_in "session[password]", with: "password"
      click_button 'Login'

      within("h1") do
        expect(page).to have_content("Admin Dashboard")
      end
    end
  end
end
