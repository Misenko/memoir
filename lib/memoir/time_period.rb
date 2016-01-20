class Memoir::TimePeriod
  attr_accessor :interval, :units

  def initialize(interval, units)
    @interval = interval
    @units = units
  end

  def to_s
    "#{interval}#{units}"
  end
end
