require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should show" do
    Product.create(x_displayname: 'testing')
    
    get "/products/dGVzdGluZw=="
    assert_response :success
  end

  test "should not show" do
    get "/products/dGVzdGluZw=="
    assert_response :success
  end
end
