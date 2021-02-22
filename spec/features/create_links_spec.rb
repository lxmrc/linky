require 'rails_helper'

RSpec.feature "Users can create links", type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(user)
  end

  scenario "with valid details" do
    visit new_link_path
    
    fill_in "Destination", with: "http://example.com"
    fill_in "Description", with: "Check this out!"

    click_button "Create Link"

    expect(page).to have_content "Link was successfully created."
    expect(page).to have_content "http://example.com"
    expect(page).to have_content "Check this out!"
  end
end
