class SubscriptionSerializer
  def self.subscription(subscription)
    {
      "data": 
        { 
          "type": subscription.class.to_s.downcase,
          "id":   subscription.id,
          "attributes": 
            {
                          "title":     subscription.title,
                          "price":     subscription.price,
                          "frequency": subscription.frequency
            }
        }
    }
  end

  def self.subscriptions(subscriptions)
    {
      "data": subscriptions.map do |subscription|
        { 
          "type": subscription.class.to_s.downcase,
          "id":   subscription.id,
          "attributes": 
            {
                          "title":     subscription.title,
                          "price":     subscription.price,
                          "frequency": subscription.frequency
            }
        }
      end
    }
  end
end
