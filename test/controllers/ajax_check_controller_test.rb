require 'test_helper'

class AjaxCheckControllerTest < ActionDispatch::IntegrationTest
  test "should get check" do
    get ajax_check_check_url
    assert_response :success
  end

end
