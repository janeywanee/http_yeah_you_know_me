require_relative 'parsing'
require 'socket'
require 'pry'
class Server
  attr_reader :tcp_server
  attr_accessor :client, :request_lines

  def initialize
    @tcp_server = TCPServer.new(9292)
    @counter = 0
    @hello_counter = 0
    @request_lines = []
  end

  def accept_connection
    @client = @tcp_server.accept
  end

  def take_in_request
    puts "Ready for a request"
    # request_lines = []
    while line = @client.gets and !line.chomp.empty?
      request_lines << line.chomp
    end
    @parsed = Parsing.new(request_lines)
    puts "Got this request:"
    puts request_lines
  end

  def response
    @counter += 1
    output = "<html><head></head><body>#{@response.join}</body></html>"
    headers = ["http/1.1 200 ok",
              "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
              "server: ruby",
              "content-type: text/html; charset=iso-8859-1",
              "content-length: #{output.length}\r\n\r\n"].join("\r\n")
    puts ["Wrote this response:", headers, output].join("\n")
    @client.puts headers
    @client.puts output
    # close_connection if @parsed.path == "/shutdown"
  end

  def close_connection
    @client = @tcp_server.close
  end

  def run
    loop do
      accept_connection
      take_in_request
      route
      response
      # close_connection
    end
  end

  def route
    @response = []
    case @parsed.path
      # FIXME:  parsing for word search path
    when @parsed.path.include?("/word_search")

      dictionary = File.read('/usr/share/dict/words')
      word = @parsed.path.split('=')[-1]
      if dictionary.include?(word)
        @response << "#{word} is a known word"
      else
        @response << "#{word} is not a known word"
      end
    when "/"
      @response << @pasred.diagnostic
    when "/hello"
      @hello_counter += 1
      @response << "Hello World! (#{@hello_counter})"
    when "/datetime"
      @response << Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')
    when "/shutdown"
      @response << "Total Requests: #{@counter}"
    else
      @response << @parsed.diagnostic
    end
  end
end



server = Server.new
server.run
# server.accept_connection
# server.take_in_request
# server.response
# server.close_connection
