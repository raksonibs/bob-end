require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post articles_url, params: { article: { location_id: @article.location_id, publishedAt: @article.publishedAt, story: @article.story, title: @article.title } }
    end

    assert_response 201
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
  end

  test "should update article" do
    patch article_url(@article), params: { article: { location_id: @article.location_id, publishedAt: @article.publishedAt, story: @article.story, title: @article.title } }
    assert_response 200
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete article_url(@article)
    end

    assert_response 204
  end
end
