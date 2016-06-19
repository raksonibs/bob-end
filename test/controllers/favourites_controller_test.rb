require 'test_helper'

class FavouritesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favourite = favourites(:one)
  end

  test "should get index" do
    get favourites_url
    assert_response :success
  end

  test "should create favourite" do
    assert_difference('Favourite.count') do
      post favourites_url, params: { favourite: { article_id: @favourite.article_id, user_id: @favourite.user_id } }
    end

    assert_response 201
  end

  test "should show favourite" do
    get favourite_url(@favourite)
    assert_response :success
  end

  test "should update favourite" do
    patch favourite_url(@favourite), params: { favourite: { article_id: @favourite.article_id, user_id: @favourite.user_id } }
    assert_response 200
  end

  test "should destroy favourite" do
    assert_difference('Favourite.count', -1) do
      delete favourite_url(@favourite)
    end

    assert_response 204
  end
end
