require 'rails_helper'

RSpec.feature "Users can edit links", type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:link) { FactoryBot.create(:link) }

  before do
    login_as(user)
  end

  scenario "with valid details" do
    visit edit_link_path(link)
    
    fill_in "Destination", with: "http://example.org"
    fill_in "Description", with: "Example.org is much better than example.com"

    click_button "Create Link"

    expect(page).to have_content "Link was successfully updated."

    expect(page).to have_content "http://example.org"
    expect(page).to have_content "Example.org is much better than example.com"

    expect(page).to_not have_content "http://example.com"
    expect(page).to_not have_content "Check this out!"
  end
end
