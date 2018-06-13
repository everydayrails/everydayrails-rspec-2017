Given("I am a new user") do
  visit root_path
end

Given("I am already registered with the email {string}") do |string|
  FactoryBot.create(:user, email: string)
  visit root_path
end

When("I sign up as {word} {word} with email {string} and password {string}") do |first_name, last_name, email, password|
  click_link "Sign up"
  fill_in "First name", with: first_name
  fill_in "Last name", with: last_name
  fill_in "Email", with: email
  fill_in "Password", with: password
  fill_in "Password confirmation", with: password
  click_button "Sign up"
end

When("I register with a mismatched password") do
  click_link "Sign up"
  fill_in "Password", with: "secret123!"
  fill_in "Password confirmation", with: "secret124!"
  click_button "Sign up"
end

Then("I am registered as {word} {word}") do |first_name, last_name|
  full_name = "#{first_name} #{last_name}"
  expect(page).to have_content "Welcome! You have signed up successfully."
  expect(page).to have_link full_name, href: edit_user_registration_path
  expect(page).to have_link "Sign Out", href: destroy_user_session_path
end

Then("I am asked to fix the mismatched password") do
  expect(page).to have_content "Password confirmation doesn't match Password"
end

Then("I am told the email is already in use") do
  expect(page).to have_content "Email has already been taken"
end
