require "test_helper"

class VideoAlbumControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get video_album_index_url
    assert_response :success
  end
end
