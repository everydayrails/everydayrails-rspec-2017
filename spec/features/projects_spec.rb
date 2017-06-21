require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  scenario "user creates a new project" do
    user = FactoryGirl.create(:user)
    sign_in_as user

    expect {
      click_link "New Project"
      fill_in "Name", with: "Test Project"
      fill_in "Description", with: "Trying out Capybara"
      click_button "Create Project"
    }.to change(user.projects, :count).by(1)

    expect(page).to have_content "Project was successfully created"
    expect(page).to have_content "Test Project"
    expect(page).to have_content "Owner: #{user.name}"
  end
end
