class Memoir::Downsample
  attr_accessor :interval, :units, :aggregator, :fill_policy

  def initialize(interval, units, aggregator, fill_policy=nil)
    @interval = interval
    @units = units
    @aggregator = aggregator
  end

  def to_s
    downsample = "#{interval}#{units}-#{aggregator}"
    downsample = "#{downsample}-#{fill_policy}" if fill_policy

    downsample
  end
end
