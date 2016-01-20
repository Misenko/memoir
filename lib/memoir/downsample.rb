class Memoir::Downsample
  attr_accessor :time_period, :aggregator, :fill_policy

  def initialize(time_period, aggregator, fill_policy = nil)
    @time_period = time_period
    @aggregator = aggregator
    @fill_policy = fill_policy
  end

  def to_s
    downsample = "#{time_period}-#{aggregator}"
    downsample = "#{downsample}-#{fill_policy}" if fill_policy

    downsample
  end
end
