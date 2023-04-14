class CustSubFacade
  def self.cust_sub_and_subscription(customer, subscription)
    CustSubPoro.new(cust_sub_and_subscription_properties(customer, subscription))
  end

  def self.cust_sub_and_subscriptions(customer, subscriptions)
    subscriptions.map do |subscription|
      CustSubPoro.new(cust_sub_and_subscription_properties(customer, subscription))
    end
  end

  def self.cust_sub_and_subscription_properties(customer, subscription)
    cust_sub = CustSub.find_by(customer_id: customer.id, subscription_id: subscription.id)
    {
      id: cust_sub.id,
      status: cust_sub.status,
      customer_id: cust_sub.customer_id,
      sub_id: cust_sub.subscription_id,
      sub_title: subscription.title,
      sub_price: subscription.price.to_s(:currency),
      sub_frequency: subscription.frequency,
      tea_id: subscription.tea.id,
      tea_title: subscription.tea.title,
      tea_description: subscription.tea.description,
      tea_temperature: subscription.tea.temperature,
      tea_brew_time: subscription.tea.brew_time
    }
  end
end
