require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get api_v1_projects_url, as: :json
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post api_v1_projects_url, params: { name: 'Learn Vue' }, as: :json
    end

    assert_response 201
  end

  test "shouldn't create with invalid paramters" do
    assert_no_difference "Project.count" do
      post api_v1_projects_url, params: { name: nil }, as: :json
    end

    assert_response :unprocessable_entity
  end

  test "should show project" do
    get api_v1_project_url(@project), as: :json
    assert_response :success
  end

  test "should update project" do
    assert_no_difference "Project.count" do
      patch api_v1_project_url(@project), params: { name: 'Learn React' }, as: :json
    end

    assert_response 200

    @project.reload
    assert_equal 'Learn React', @project.name
  end

  test "shouldn't update with invalid paramters" do
    assert_no_difference "Project.count" do
      patch api_v1_project_url(@project), params: { name: nil }, as: :json
    end

    assert_response :unprocessable_entity
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete api_v1_project_url(@project), as: :json
    end

    assert_response 204
  end
end
