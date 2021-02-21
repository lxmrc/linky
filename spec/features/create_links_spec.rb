require 'rails_helper'

RSpec.feature "Create links", type: :feature do
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
