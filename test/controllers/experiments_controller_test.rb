require "test_helper"

class ExamplesControllerTest < ActionDispatch::IntegrationTest

  test "should show" do
    get "/experiment"
    assert_response :success
  end
end
