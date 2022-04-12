require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should show" do
    get "/products/U3R1Y2sgSW4gVGhlIENpdHkgU2F0aW4gTWlkaSBEcmVzcyAtIFllbGxvdw=="
    assert_response :success
  end
end
