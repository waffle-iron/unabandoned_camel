require 'rails_helper'

describe "admin can view all items" do
  scenario "admin visits admin/dasboard, to be redirected to all items page" do
    bean_one = Bean.create(title:"Java", 
                            description:"fair trade",
                            price: 14.20)

    bean_two = Bean.create(title:"Mocha Java", 
                            description:"not fair trade",
                            price: 13.20,
                            status: 1)                        

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

    visit admin_dashboard_path

    click_on "View All Items"

    expect(current_path).to eq(admin_beans_path)

    within all('#item-link').first do
      expect(page).to have_content("Java")
    end
    within all('#item-description').first do    
      expect(page).to have_content("fair trade")
    end
    within all('#item-status').first do    
      expect(page).to have_content("Active")
    end
    within all('#item-action').first do        
      expect(page).to have_content("Edit")
    end


    within all('#item-link').last do    
      expect(page).to have_content("Mocha Java")
    end
    within all('#item-description').last do        
      expect(page).to have_content("not fair trade")
    end
    within all('#item-status').last do    
      expect(page).to have_content("Retired")
    end
    within all('#item-action').last do        
      expect(page).to have_content("Edit")
    end
    
    expect(Bean.count).to eq(2)
  end
end
    

