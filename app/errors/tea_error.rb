class TeaError < StandardError
  attr_reader :exception_type,
              :details,
              :status

  def initialize(message: 'Invalid content', details: 'Invalid record', status: 400)
    @details = details
    @status = status
    @exception_type = 'Records'
    super(message)
  end
end
