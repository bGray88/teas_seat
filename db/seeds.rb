Customer.delete_all
Subscription.delete_all
Tea.delete_all
CustSub.delete_all

FactoryBot.create_list(:customer, 10)
FactoryBot.create_list(:subscription, 10)
FactoryBot.create_list(:tea, 10)

CustSub.create(customer_id: Customer.first.id, subscription_id: Subscription.first.id)
CustSub.create(customer_id: Customer.first.id, subscription_id: Subscription.second.id)
CustSub.create(customer_id: Customer.first.id, subscription_id: Subscription.third.id)
CustSub.create(customer_id: Customer.second.id, subscription_id: Subscription.fourth.id)
CustSub.create(customer_id: Customer.second.id, subscription_id: Subscription.fifth.id)
