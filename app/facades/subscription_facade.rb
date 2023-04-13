class SubscriptionFacade
  def self.subscription(customer, subscription)
    cust_sub = CustSub.find_by(customer_id: customer.id, subscription_id: subscription.id)
    {
      id: subscription.id,
      title: subscription.title,
      price: subscription.price,
      frequency: subscription.frequency,
      status: cust_sub.status,
      tea_id: subscription.tea_id,
      created_at: subscription.created_at,
      updated_at: subscription.updated_at
    }
  end

  def self.subscriptions(customer, subscriptions)
    subscriptions.map do |subscription|
      cust_sub = CustSub.find_by(customer_id: customer.id, subscription_id: subscription.id)
      {
        id: subscription.id,
        title: subscription.title,
        price: subscription.price,
        frequency: subscription.frequency,
        status: cust_sub.status,
        tea_id: subscription.tea_id,
        created_at: subscription.created_at,
        updated_at: subscription.updated_at
      }
    end
  end
end
