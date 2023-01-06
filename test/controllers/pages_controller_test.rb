require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get home" do
    get pages_home_url

    assert_response :success
  end

  test 'root page is 200' do
    get '/'

    assert_response 200
  end
end
