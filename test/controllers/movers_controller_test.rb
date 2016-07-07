require 'test_helper'

class MoversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mover = movers(:one)
  end

  test "should get index" do
    get movers_url
    assert_response :success
  end

  test "should create mover" do
    assert_difference('Mover.count') do
      post movers_url, params: { mover: {  } }
    end

    assert_response 201
  end

  test "should show mover" do
    get mover_url(@mover)
    assert_response :success
  end

  test "should update mover" do
    patch mover_url(@mover), params: { mover: {  } }
    assert_response 200
  end

  test "should destroy mover" do
    assert_difference('Mover.count', -1) do
      delete mover_url(@mover)
    end

    assert_response 204
  end
end
