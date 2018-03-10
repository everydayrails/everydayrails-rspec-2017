require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  scenario "user creates a new project" do
    user = FactoryGirl.create(:user)
    login_as user, scope: :user
    visit root_path

    expect {
      click_link "Sign in"
      fill_in "Email", with: user.Email
      fill_in "Password", with: user.Password
      click_button "Log in"
    }.to change(user.projects, :count).by(1)

    aggregate_failures do
      expect(page).to have_content "Project was successfully created"
      expect(page).to have_content "Test Project"
      expect(page).to have_content "Owner: #{user.name}"
    end
  end
end
