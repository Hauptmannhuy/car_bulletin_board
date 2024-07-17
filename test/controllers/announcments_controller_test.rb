require "test_helper"

class AnnouncmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get announcments_index_url
    assert_response :success
  end

  test "should get create" do
    get announcments_create_url
    assert_response :success
  end
end
