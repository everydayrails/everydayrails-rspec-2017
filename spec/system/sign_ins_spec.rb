require 'rails_helper'

RSpec.describe "Sign in", type: :system do
  let(:user) { FactoryGirl.create(:user) }

  before do
    ActiveJob::Base.queue_adapter = :test
  end

  it "user signs in" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect {
      GeocodeUserJob.perform_later(user)
    }.to have_enqueued_job.with(user)
  end
end
