Given("I am a new user") do
  visit root_path
end

When("I register for an account") do
  click_link "Sign up"
  fill_in "First name", with: "Test"
  fill_in "Last name", with: "User"
  fill_in "Email", with: "testuser@example.com"
  fill_in "Password", with: "secret123!"
  fill_in "Password confirmation", with: "secret123!"
  click_button "Sign up"
end

When("I register with a mismatched password") do
  click_link "Sign up"
  fill_in "Password", with: "secret123!"
  fill_in "Password confirmation", with: "secret124!"
  click_button "Sign up"
end

Then("I am a registered user") do
   expect(page).to have_content "Welcome! You have signed up successfully."
   expect(page).to have_link "Test User", href: edit_user_registration_path
   expect(page).to have_link "Sign Out", href: destroy_user_session_path
end

Then("I am asked to fix the mismatched password") do
  expect(page).to have_content "Password confirmation doesn't match Password"
end
