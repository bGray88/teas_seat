class CustSubPoro
  attr_reader :id,
              :status,
              :customer_id,
              :sub_id,
              :sub_title,
              :sub_price,
              :sub_frequency,
              :tea_id,
              :tea_title,
              :tea_description,
              :tea_temperature,
              :tea_brew_time

  def initialize(data)
    @id              = data[:id]
    @status          = data[:status]
    @customer_id     = data[:customer_id]
    @sub_id          = data[:sub_id]
    @sub_title       = data[:sub_title]
    @sub_price       = data[:sub_price]
    @sub_frequency   = data[:sub_frequency]
    @tea_id          = data[:tea_id]
    @tea_title       = data[:tea_title]
    @tea_description = data[:tea_description]
    @tea_temperature = data[:tea_temperature]
    @tea_brew_time   = data[:tea_brew_time]
  end
end
