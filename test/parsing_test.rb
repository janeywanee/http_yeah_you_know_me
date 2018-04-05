require 'minitest/autorun'
require 'minitest/pride'
require './lib/parsing'
require 'pry'

class ParsingTest < Minitest::Test

  def setup
    @response_data = ["GET / HTTP/1.1",
                     "Host: 127.0.0.1:9292",
                     "Connection: keep-alive",
                     "Cache-Control: no-cache",
                     "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36",
                     "Postman-Token: 4883113e-0f45-62a8-d833-d6851d70c2ff",
                     "Accept: */*",
                     "Accept-Encoding: gzip, deflate, br",
                     "Accept-Language: en-US,en;q=0.9"]
  end

  def test_it_exists
    parsing = Parsing.new(@response_data)

    assert_instance_of Parsing, parsing
  end

  def test_verb_returns_verb_from_request
    parsing = Parsing.new(@response_data)

    assert_equal "GET", parsing.verb
  end

  def test_path_returns_path_from_request
    parsing = Parsing.new(@response_data)

    assert_equal "/", parsing.path
  end

  def test_protocol_returns_protocol_from_request
    parsing = Parsing.new(@response_data)

    assert_equal "HTTP/1.1", parsing.protocol
  end

  def test_host_returns_host_from_request
    parsing = Parsing.new(@response_data)

    assert_equal "127.0.0.1", parsing.host
  end

  def test_port_returns_port_from_request
    parsing = Parsing.new(@response_data)

    assert_equal "9292", parsing.port
  end

  def test_origin_returns_origin_from_request
    parsing = Parsing.new(@response_data)

    assert_equal "127.0.0.1", parsing.origin
  end

  def test_accept_returns_accept_from_request
    parsing = Parsing.new(@response_data)

    assert_equal "*/*", parsing.accept
  end

  def test_diagonostic_outputs_data
    parsing = Parsing.new(@response_data)
    expected = "<pre>\r\nVerb: GET\nPath: /\nProtocol: HTTP/1.1\nHost: 127.0.0.1\nPort: 9292\nOrigin: 127.0.0.1\nAccept:*/*</pre>"
    assert_equal expected, parsing.diagnostic
  end
end
