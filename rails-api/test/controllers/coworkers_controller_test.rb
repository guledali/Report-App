require 'test_helper'

class CoworkersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coworker = coworkers(:one)
  end

  test "should get index" do
    get coworkers_url, as: :json
    assert_response :success
  end

  test "should create coworker" do
    assert_difference('Coworker.count') do
      post coworkers_url, params: { coworker: { arrived: @coworker.arrived, name: @coworker.name, sha: @coworker.sha } }, as: :json
    end

    assert_response 201
  end

  test "should show coworker" do
    get coworker_url(@coworker), as: :json
    assert_response :success
  end

  test "should update coworker" do
    patch coworker_url(@coworker), params: { coworker: { arrived: @coworker.arrived, name: @coworker.name, sha: @coworker.sha } }, as: :json
    assert_response 200
  end

  test "should destroy coworker" do
    assert_difference('Coworker.count', -1) do
      delete coworker_url(@coworker), as: :json
    end

    assert_response 204
  end
end
