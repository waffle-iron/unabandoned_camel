require 'rails_helper'

RSpec.feature "Guest can visit the root page" do
  it "sees storefront when viewing root" do
    visit root_path

    within("h1") do
      expect(page).to have_content("Abandoned Camel Coffee Mercantile")
    end
  end
end