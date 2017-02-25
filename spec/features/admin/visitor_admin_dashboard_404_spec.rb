require 'rails_helper'

describe 'as a visitor' do
  describe 'when I visit /admin/dashboard' do
    it 'I will see a 404 message' do
      
      visit 'admin/dashboard'

      expect(page).to_not have_content("Admin Dashboard")

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
