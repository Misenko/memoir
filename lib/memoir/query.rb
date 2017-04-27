class Memoir::Query
  attr_accessor :aggregator, :metric, :explicit_tags, :rate, :rate_options, :downsample, :filters

  def initialize(aggregator, metric, downsample = nil, explicit_tags = false, rate = false, rate_options = {})
    @aggregator = aggregator
    @metric = metric
    @downsample = downsample
    @rate = rate
    @rate_options = rate_options
    @tags = {}
    @filters = []
    @explicit_tags = explicit_tags
  end

  def <<(filter)
    add_filter(filter)
  end

  def add_filter(filter)
    filters << filter
  end

  def remove_filter(filter)
    filters.delete filter
  end

  def clear_filters
    filters.clear
  end

  def to_h
    hash = {
      'aggregator' => aggregator,
      'metric' => metric,
      'rate' => rate,
      'explicitTags' => explicit_tags
    }

    hash['rateOptions'] = rate_options unless rate_options.empty?
    hash['downsample'] = downsample.to_s if downsample
    hash['filters'] = filters.map(&:to_h) unless filters.empty?

    hash
  end
end
