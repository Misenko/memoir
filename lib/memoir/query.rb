class Memoir::Query
  attr_accessor :aggregator, :metric, :rate, :rate_options, :downsample, :tags, :filters

  def initialize(aggregator, metric, rate=false, rate_options={})
    @aggregator = aggregator
    @metric = metric
    @rate = rate
    @rate_options = rate_options
  end
end
