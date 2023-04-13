require 'rails_helper'

RSpec.describe "CustSubs", type: :request do
  before(:each) do
    @customer1     = create(:customer)
    @customer2     = create(:customer)
    @teas          = create_list(:tea, 10)
    @subscription1 = create(:subscription, tea: @teas.sample)
    @subscription2 = create(:subscription, tea: @teas.sample)
    @subscription3 = create(:subscription, tea: @teas.sample)
    @subscription4 = create(:subscription, tea: @teas.sample)
    @subscription5 = create(:subscription, tea: @teas.sample)
    @cust_sub1     = CustSub.create(customer_id: @customer1.id, subscription_id: @subscription1.id)
    @cust_sub2     = CustSub.create(customer_id: @customer1.id, subscription_id: @subscription2.id)
    @cust_sub3     = CustSub.create(customer_id: @customer1.id, subscription_id: @subscription4.id)

    @headers = {
      'CONTENT_TYPE': 'application/json',
      'ACCEPT': 'application/json'
    }
  end

  describe "GET /index" do
    it 'can get customer subscriptions' do
      payload = { customer: { customer_id: @customer1.id } }
      get api_v1_cust_subs_path, headers: @headers, params: payload
      expect(response).to be_successful

      cust_subscriptions = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(cust_subscriptions).to be_a(Array)
      expect(cust_subscriptions.length).to eq(3)

      cust_subscription = cust_subscriptions[0]

      expect(cust_subscription.dig(:attributes, :frequency)).to eq(@subscription1.frequency)
      expect(cust_subscription.dig(:attributes, :price)).to eq(@subscription1.price)
      expect(cust_subscription.dig(:attributes, :title)).to eq(@subscription1.title)
    end
  end
end
