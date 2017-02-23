require 'rails_helper'

  feature 'guest visits show page' do
    scenario 'guest sees bean information' do
      bean = create(:bean)

      visit bean_path(bean)

      within('h2') do
        expect(page).to have_content(bean.title)
      end
      within all('p').first do
        expect(page).to have_content(bean.description)
      end
      within(".col-md-7 p:nth-child(2)") do
        expect(page).to have_content(bean.price)
      end
      # expect(page).to have_content(bean.image)
    end
  end
