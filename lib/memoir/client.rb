class Memoir::Client
  attr_accessor :host, :port, :connection, :timeout, :logger

  API_QUERY_URL = '/api/query'.freeze

  def initialize(host, port, logger = nil, options = {})
    @host = host
    @port = port
    @timeout = options[:timeout] || 10
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
    Memoir::Response.new(connection.post API_QUERY_URL, request.to_h)
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
      builder.request :json
      builder.response :json
      builder.adapter Faraday.default_adapter
      builder.options[:timeout] = @timeout
      builder.options[:open_timeout] = @timeout
    end
  end
end
