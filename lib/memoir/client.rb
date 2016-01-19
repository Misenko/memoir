class Memoir::Client
  attr_accessor :host, :port, :connection, :logger

  API_QUERY_URL = '/api/query'
  API_QUERY_EXP_URL = '/api/query/exp'
  API_QUERY_GEXP_URL = '/api/query/gexp'
  API_QUERY_LAST_URL = '/api/query/last'

  def initialize(host, port, logger=nil)
    @host = host
    @port = port
    @logger = logger
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

  def run(request)
    connection.post API_QUERY_URL, request.to_h
  end

  def dry_run(request)
    if logger
      logger.info request.to_json
    else
      puts request.to_json
    end
  end

  private

  def prepare_connection
    @connection = Faraday.new(url: "#{host}:#{port}") do |builder|
      builder.request  :json
      builder.response :json
      builder.adapter Faraday.default_adapter
    end
  end
end
