class SubscriptionSerializer
  def self.subscription(subscription)
    {
      "data": sub_properties(subscription)
    }
  end

  def self.subscriptions(subscriptions)
    {
      "data": subscriptions.map do |subscription|
        sub_properties(subscription)
      end
    }
  end

  def self.sub_properties(subscription)
    {
      "type":       "subscription",
      "id":         subscription.sub_id,
      "attributes": {
        "title":     subscription.sub_title,
        "price":     subscription.sub_price,
        "status":    subscription.status,
        "frequency": subscription.sub_frequency,
        "tea": {
          "type":      "tea",
          "id":        subscription.tea_id,
          "attributes":
            {
              "title":       subscription.tea_title,
              "description": subscription.tea_description,
              "temperature": subscription.tea_temperature,
              "brew_time":   subscription.tea_brew_time
            }
        }
      }
    }
  end
end
