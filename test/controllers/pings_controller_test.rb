require "test_helper"

class PingsControllerTest < ActionDispatch::IntegrationTest
  test 'should get ping' do
    get '/ping'

    assert_response 200
  end
end
