require "test_helper"

class PingsControllerTest < ActionDispatch::IntegrationTest
  test 'should get ping' do
    get '/ping'

    assert_response 200
  end

  test 'should get rev' do
    get '/rev'

    assert_response 200
    assert_equal `git rev-parse --short HEAD`.chomp, @response.body.to_s.chomp
  end
end
