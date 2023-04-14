class SubscriptionPoro
  attr_reader :id,
              :title,
              :price,
              :frequency,
              :status,
              :tea_id,
              :tea_title,
              :tea_description,
              :tea_temperature,
              :tea_brew_time

  def initialize(data)
    @id              = data[:id]
    @title           = data[:title]
    @price           = data[:price]
    @frequency       = data[:frequency]
    @status          = data[:status]
    @tea_id          = data[:tea_id]
    @tea_title       = data[:tea_title]
    @tea_description = data[:tea_description]
    @tea_temperature = data[:tea_temperature]
    @tea_brew_time   = data[:tea_brew_time]
  end
end
