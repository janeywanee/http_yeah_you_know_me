require 'minitest/autorun'
require 'minitest/pride'
require './lib/server'
require 'faraday'

class RequestTest < Minitest::Test

  def test_request_returns_hello_world
    response = Faraday.get "http://127.0.0.1:9292"

    assert_equal "<html><head></head><body><pre> Hello, World!(1) </pre></body></html>", response.body
  end
end
