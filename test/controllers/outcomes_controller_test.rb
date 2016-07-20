require 'test_helper'

class OutcomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @outcome = outcomes(:one)
  end

  test "should get index" do
    get outcomes_url
    assert_response :success
  end

  test "should create outcome" do
    assert_difference('Outcome.count') do
      post outcomes_url, params: { outcome: {  } }
    end

    assert_response 201
  end

  test "should show outcome" do
    get outcome_url(@outcome)
    assert_response :success
  end

  test "should update outcome" do
    patch outcome_url(@outcome), params: { outcome: {  } }
    assert_response 200
  end

  test "should destroy outcome" do
    assert_difference('Outcome.count', -1) do
      delete outcome_url(@outcome)
    end

    assert_response 204
  end
end
