class Memoir::Response
  attr_accessor :data_sets, :stats_summary, :status, :raw

  def initialize(faraday_response)
    @data_sets = []
    @status = faraday_response.status
    @raw = faraday_response.body
    parse_response(raw)
  end

  private

  def parse_response(response)
    response.each do |field|
      if field.include? 'statsSummary'
        @stats_summary = field['statsSummary']
        next
      end

      data_sets << Memoir::DataSet.new(field)
    end
  end
end
