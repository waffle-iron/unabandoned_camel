require 'rails_helper'

describe 'when an admin logs in' do
  it 'is redirected to the admin dashboard page' do

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

    expect(current_path).to eq('/admin/dashboard')

  end
end
