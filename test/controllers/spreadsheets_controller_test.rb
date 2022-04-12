require "test_helper"

class SpreadsheetsControllerTest < ActionDispatch::IntegrationTest
  test "should get /upload" do
    get "/upload"
    assert_response :success
  end

  test "should patch /spreadsheet" do
    patch "/spreadsheet", params: { spreadsheet: fixture_file_upload('spreadsheet.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet') }, headers: { accept: Mime[:turbo_stream].to_s }
    assert_response :redirect
  end
end
