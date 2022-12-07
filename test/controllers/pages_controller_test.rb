require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    sign_in users(:batcat)
  end

  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test 'root page is 200' do
    get '/'
    assert_response 200
  end

  test 'getting root without signing in' do
    sign_out users(:batcat)

    get '/'
    assert_redirected_to "http://www.example.com/users/sign_in"
  end
end
