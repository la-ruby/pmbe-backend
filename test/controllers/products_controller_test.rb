require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest

  test "should show" do
    get "/products/example"
    assert_response :success
  end
end
