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
      "id":         subscription.id,
      "attributes": {
        "title":     subscription.title,
        "price":     subscription.price,
        "status":    subscription.status,
        "frequency": subscription.frequency,
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
