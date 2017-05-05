require 'test_helper'

class Api::ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_projects_index_url
    assert_response :success
  end

  test "should get show" do
    get api_projects_show_url
    assert_response :success
  end

  test "should get create" do
    get api_projects_create_url
    assert_response :success
  end

end
