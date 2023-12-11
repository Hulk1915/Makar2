require "test_helper"

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get authors_new_url
    assert_response :success
  end

  test "should get add_author" do
    get authors_add_author_url
    assert_response :success
  end
end
