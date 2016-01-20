class Memoir::Error
  attr_accessor :code, :message, :details, :trace

  def initialize(error)
    @code = error['code']
    @message = error['message']
    @details = error['details']
    @trace = error['trace']
  end
end
