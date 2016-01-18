class Memoir::Request
  attr_accessor :start_time, :end_time, :queries

  def initialize(start_time=nil, end_time=nil)
    @start_time = start_time
    @end_time = end_time
    @queries = []
  end

  def <<(query)
    queries << query
  end

  def to_json
    { start: start_time.to_i, end: end_time.to_i, queries: queries }.to_json
  end
end
