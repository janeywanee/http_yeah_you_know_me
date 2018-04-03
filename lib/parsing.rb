class Parsing
  attr_reader :verb,
              :path,
              :protocol,
              :host,
              :port,
              :origin,
              :accept

  def initialize(response_data)
    @verb = response_data[0].split[0]
    @path = response_data[0].split[1]
    @protocol = response_data[0].split[2]
    @host = response_data[1].split[1].split(':')[0]
    @port = response_data[1].split[1].split(':')[1]
    @origin = response_data[1].split[1].split(':')[0]
    @accept = response_data.find { |item| item.start_with?('Accept:') }.split[1]
end
