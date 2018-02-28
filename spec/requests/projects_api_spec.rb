require 'rails_helper'

RSpec.describe "Projects Api", type: :request do
  it 'loads a project' do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:project, name: "Sample Project")
    FactoryGirl.create(:project, name: "Second Sample Project", owner: user)

    get api_projects_path, params: {
      user_email: user.email,
      user_token: user.authentication_token
    }

    expect(response).to have_http_status(:success)
    json = JSON.parse(response.body)
    expect(json.length).to eq 1
    project_id = json[0]["id"]

    get api_projects_path(project_id), params: {
      user_email: user.email,
      user_token: user.authentication_token
    )

    expect(response).to have_http_status(:success)
    json = JSON.parse(response.body)
    expect(json["name"]).to eq "Second Sample Project"
  end
end
