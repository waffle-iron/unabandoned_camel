describe 'when a visitor with items in cart logs in to a user session' do
  describe 'and navigates to the cart page' do
    it 'cart still has visitor items' do

       Bean.create(id: 1, title:"Dark Roast", description:"good",
                          price:1, image:"123")


      user = User.create(email: 'test@test.com',
                  password: 'password',
                  password_confirmation: 'password')

      visit beans_path

      click_button "Add Item"

      visit login_path

      fill_in "session[email]", with: "test@test.com"
      fill_in "session[password]", with: "password"
      click_button 'Login'

      visit cart_index_path

      within(".caption") do
        expect(page).to have_content("Dark Roast")
        expect(page).to have_content("good")
        expect(page).to have_content("1")
      end
    end
  end

  describe 'and clicks logout' do
    it 'logs out and displays login' do

      user = User.create(email: 'test@test.com',
                  password: 'password',
                  password_confirmation: 'password')

      visit login_path

      fill_in "session[email]", with: "test@test.com"
      fill_in "session[password]", with: "password"
      click_button 'Login'

      within('.logout') do
        click_link 'Logout'
      end

      within('.login') do
        expect(page).to have_content("Login")
      end

      expect(page).to_not have_content("Logout")
    end
  end
end
