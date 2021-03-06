# Class representing individual results in response
class Memoir::DataSet
  attr_accessor :metric, :tags, :aggregated_tags, :dps, :annotations, :global_annotations, :tsuids, :query

  def initialize(data_set)
    @metric = data_set['metric']
    @tags = data_set['tags'] || {}
    @aggregated_tags = data_set['aggregatedTags'] || []
    @annotations = data_set['annotations'] || []
    @global_annotations = data_set['globalAnnotations'] || []
    @tsuids = data_set['tsuids'] || []
    @query = query || {}
    @dps = data_set['dps']
  end
end
