require 'minitest/autorun'
require 'minitest/pride'
require './lib/server'
require 'faraday'

class ServerTest < Minitest::Test

  def test_server_can_work_with_more_than_one_port
    server = Server.new(2001)

    assert_instance_of Server, server
    assert_instance_of TCPServer, server.tcp_server
  end
end








# def test_request_returns_hello_world
#   response = Faraday.get "http://127.0.0.1:9292"
#
#   assert_equal "<html><head></head><body><pre> Hello, World!(1) </pre></body></html>", response.body
# end
