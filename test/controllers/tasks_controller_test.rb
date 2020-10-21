require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
    @project = projects(:one)
  end

  test 'should get index' do
    get api_v1_tasks_url, as: :json
    assert_response :success
  end

  test 'should create task' do
    assert_difference('Task.count') do
      post api_v1_project_tasks_url(@project), params: { date: '2020-10-21',
                                                         description: 'Deliver the project',
                                                         status: 'ongoing',
                                                         project_id: @project.id }, as: :json
    end

    assert_response 201
  end

  test "shouldn't create with invalid paramters" do
    assert_no_difference 'Task.count' do
      post api_v1_project_tasks_url(@project), params: { date: nil,
                                                         description: nil,
                                                         status: nil }, as: :json
    end

    assert_response :unprocessable_entity
  end

  test 'should show task' do
    get api_v1_task_url(@task), as: :json
    assert_response :success
  end

  test 'should update task' do
    assert_no_difference 'Task.count' do
      patch api_v1_task_url(@task), params: { date: '2020-10-18',
                                              description: 'Create the API and try it on Postman',
                                              status: 'ongoing' }, as: :json
    end
    assert_response 200

    @task.reload
    assert_equal '2020-10-18', @task.date
    assert_equal 'Create the API and try it on Postman', @task.description
    assert_equal 'ongoing', @task.status
  end

  test "shouldn't update with invalid paramters" do
    assert_no_difference 'Task.count' do
      patch api_v1_task_url(@task), params: { date: nil,
                                              description: nil,
                                              status: nil }, as: :json
    end

    assert_response :unprocessable_entity
  end

  test 'should destroy task' do
    assert_difference('Task.count', -1) do
      delete api_v1_task_url(@task), as: :json
    end

    assert_response 204
  end
end
