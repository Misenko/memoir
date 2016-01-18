class Memoir::Client
  attr_accessor :host, :port, :connection

  API_QUERY_URL = '/api/query'
  API_QUERY_EXP_URL = '/api/query/exp'
  API_QUERY_GEXP_URL = '/api/query/gexp'
  API_QUERY_LAST_URL = '/api/query/last'

  def initialize(host, port)
    @host = host
    @port = port
    prepare_connection
  end

  def host=(host)
    @host = host
    prepare_connection
  end

  def port=(port)
    @port = port
    prepare_connection
  end

  private

  def prepare_connection
    @connection = Faraday.new(url: "#{host}:#{port}") do |buidler|
      builder.request  :json
    end
  end
end
