require 'socket'
class Server

  def initialize
    @tcp_server = TCPServer.new(9292)
    @counter = 0
  end

  def accept_connection
    @client = @tcp_server.accept
  end

  def take_in_request
    puts "Ready for a request"
    request_lines = []
    binding.pry
    while line = @client.gets and !line.chomp.empty?
      request_lines << line.chomp
    end
    puts "Got this request:"
    puts request_lines
  end

  def response
    response = "<pre> Hello,World!(#{@counter}) </pre>"
    @counter += 1
    output = "<html><head></head><body>#{response}</body></html>"
    headers = ["http/1.1 200 ok",
              "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
              "server: ruby",
              "content-type: text/html; charset=iso-8859-1",
              "content-length: #{output.length}\r\n\r\n"].join("\r\n")
    @client.puts headers
    @client.puts output

    puts ["Wrote this response:", headers, output].join("\n")
  end

  def close_connection
    @client = @tcp_server.close
  end
end



server = Server.new
server.accept_connection
server.take_in_request
server.response
server.close_connection
