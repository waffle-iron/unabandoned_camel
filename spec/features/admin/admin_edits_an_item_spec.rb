require 'rails_helper'

describe "an admin edits an item" do
  scenario "admin views all items and selects one to edit" do
    bean_one = Bean.create(title:"Java", 
                            description:"fair trade",
                            price: 14.20,
                            status: 0)

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

    visit admin_beans_path
    click_on "Edit"

    fill_in "bean[title]", with: "Moka Java"
    fill_in "bean[description]", with: "Compromised of half Ardi and half Sumatra"
    fill_in "bean[status]", with: 0
    #file_fixture_path 'test.jpg'
    click_on "Update Bean"

    expect(current_path).to eq(admin_beans_path)

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
