class Memoir::Request
  attr_accessor :start_time, :end_time, :queries, :options

  VALID_OPTIONS = {
    no_annotations: 'noAnnotations',
    global_annotations: 'globalAnnotations',
    ms_resolution: 'msResolution',
    show_tsuids: 'showTSUIDs',
    show_summary: 'showSummary',
    show_query: 'showQuery',
    delete: 'delete'
  }

  def initialize(start_time, end_time=nil, **options)
    fail Memoir::Errors::ArgumentError, "start_time cannot be nil" unless start_time

    @start_time = start_time
    @end_time = end_time
    @queries = []
    @options = options
  end

  def <<(query)
    add_query(query)
  end

  def add_query(query)
    queries << query
  end

  def to_json
    JSON.pretty_generate(to_h)
  end

  def to_h
    validate!

    hash = {
      'start' => start_time.instance_of?(Memoir::TimePeriod) ? start_time.to_s : start_time.to_i,
      'queries' => queries.map(&:to_h)
    }

    hash['end'] = end_time.to_i if end_time
    options.each_pair { |key, value| hash[VALID_OPTIONS[key]] = value }

    hash
  end

  private

  def validate!
    fail Memoir::Errors::RequestError, "Request has to contain at least one query" if queries.empty?

    options.keys.each do |key|
      fail Memoir::Errors::RequestError, "Unknown option #{key.inspect}" unless VALID_OPTIONS.keys.include? key
    end
  end
end
