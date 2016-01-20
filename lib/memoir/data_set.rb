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
    self.dps = data_set['dps'] || {}
  end

  def dps=(dps_object)
    @dps = dps_object.instance_of?(Array) ? dps_object.to_h : dps_object
  end
end
