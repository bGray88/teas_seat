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
      "id":         subscription[:id],
      "attributes":
        {
          "title":     subscription[:title],
          "price":     subscription[:price],
          "status":    subscription[:status],
          "frequency": subscription[:frequency],
          "tea":
            {
              title: subscription[:tea].title,
              description: subscription[:tea].description,
              temperature: subscription[:tea].temperature,
              brew_time: subscription[:tea].brew_time
            }
        }
    }
  end
end
