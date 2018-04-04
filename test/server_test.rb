require 'minitest/autorun'
require 'minitest/pride'
require './lib/server'
require 'faraday'
require 'pry'

class ServerTest < Minitest::Test

  def test_server_can_work_with_more_than_one_port
    server = Server.new

    assert_instance_of Server, server
    assert_instance_of TCPServer, server.tcp_server
  end

  def test_it_has_a_connection
    skip
    server = Server.new
    server.accept_connection
    Faraday.get('http://localhost:9292')

  end
end







#
# def test_request_returns_hello_world
#   response = Faraday.get "http://127.0.0.1:9292"
#
#   assert_equal "<html><head></head><body><pre> Hello, World!(1) </pre></body></html>", response.body
# end
