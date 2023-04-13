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

  describe "POST /create" do
    it 'can assign user a subscription' do
      payload = {
        customer: { customer_id: @customer1.id },
        subscription: { subscription_id: @subscription3.id }
      }
      post api_v1_cust_subs_path(payload), headers: @headers
      expect(response).to be_successful

      cust_subscription = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(cust_subscription).to be_a(Hash)
      expect(cust_subscription.dig(:attributes, :frequency)).to eq(@subscription3.frequency)
      expect(cust_subscription.dig(:attributes, :price)).to eq("$#{@subscription3.price}")
      expect(cust_subscription.dig(:attributes, :title)).to eq(@subscription3.title)
    end
  end
end
