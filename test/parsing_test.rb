require 'mintest/autorun'
require 'mintest/pride'
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
end