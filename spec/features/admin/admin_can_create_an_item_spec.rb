require 'rails_helper'

describe "admin can create an item" do
  scenario "admin creates an item" do
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

       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)


      visit new_admin_bean_path

      fill_in "bean[title]", with: "Moka Java"
      fill_in "bean[description]", with: "Compromised of half Ardi and half Sumatra"
      fill_in "bean[price]", with: 14.5
      fill_in "bean[status]", with: 0
      click_on "Add Bean"

      expect(current_path).to eq(admin_beans_path)
      expect(Bean.count).to eq(1)

      within ('#item-link') do
        expect(page).to have_content("Moka Java")
      end
      within ('#item-description') do
        expect(page).to have_content("Compromised of half Ardi and half Sumatra")
      end
      within ('#item-status') do
        expect(page).to have_content("Active")
      end
  end
end
