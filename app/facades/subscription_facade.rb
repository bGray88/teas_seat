class SubscriptionFacade
  def self.subscription(customer, subscription)
    SubscriptionPoro.new(sub_properties(customer, subscription))
  end

  def self.subscriptions(customer, subscriptions)
    subscriptions.map do |subscription|
      SubscriptionPoro.new(sub_properties(customer, subscription))
    end
  end

  def self.sub_properties(customer, subscription)
    cust_sub = CustSub.find_by(customer_id: customer.id, subscription_id: subscription.id)
    {
      id: subscription.id,
      title: subscription.title,
      price: subscription.price.to_s(:currency),
      frequency: subscription.frequency,
      status: cust_sub.status,
      tea_id: subscription.tea.id,
      tea_title: subscription.tea.title,
      tea_description: subscription.tea.description,
      tea_temperature: subscription.tea.temperature,
      tea_brew_time: subscription.tea.brew_time
    }
  end
end
