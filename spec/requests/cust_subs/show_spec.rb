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

  describe "GET /show" do
    it 'can get customer subscription join record' do
      payload = {
        customer: { customer_id: @customer1.id },
        subscription: { subscription_id: @subscription1.id }
      }
      get api_v1_cust_sub_path, headers: @headers, params: payload
      expect(response).to be_successful

      cust_subscription = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(cust_subscription[:id]).to eq(@cust_sub1.id)
      expect(cust_subscription.dig(:attributes, :status)).to eq(@cust_sub1.status)
      expect(cust_subscription.dig(:attributes, :customer_id)).to eq(@customer1.id)
      expect(cust_subscription.dig(:attributes, :subscription_id)).to eq(@subscription1.id)
    end

    it 'will return error message if subscriptions non-existent' do
      payload = {
        customer: { customer_id: @customer2.id },
        subscription: { subscription_id: @subscription1.id }
      }
      get api_v1_cust_sub_path, headers: @headers, params: payload
      expect(response).to_not be_successful

      show_response = JSON.parse(response.body, symbolize_names: true)

      expect(show_response.dig(:errors, 0, :details)).to eq("Customer Subscription not found")
    end
  end
end
