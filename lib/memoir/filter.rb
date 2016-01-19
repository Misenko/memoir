class Memoir::Filter
  attr_accessor :type, :tagk, :filter, :group_by

  def initialize(type, tagk, filter, group_by=false)
    @type = type
    @tagk = tagk
    @filter = filter
    @group_by = group_by
  end

  def to_h
    {
      'type' => type,
      'tagk' => tagk,
      'filter' => filter,
      'groupBy' => group_by
    }
  end
end
