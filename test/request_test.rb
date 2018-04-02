require 'minitest/autorun'
require 'minitest/pride'
require './lib/request'
require 'faraday'

class RequestTest < Minitest::Test

  def test_request_returns_hello_world
    response = Faraday.get "http://127.0.0.1:9292"

    assert_equal "Hello, World!", response.body
  end
end
