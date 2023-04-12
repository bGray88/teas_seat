require 'rails_helper'

RSpec.describe "CustSubs", type: :request do
  before(:each) do
    @customer_a    = create(:customer)
    @customer_b    = create(:customer)
    @teas          = create_list(:tea, 10)
    @subscription1 = create(:subscription, tea: @teas.sample)
    @subscription2 = create(:subscription, tea: @teas.sample)
    @subscription3 = create(:subscription, tea: @teas.sample)
    @subscription4 = create(:subscription, tea: @teas.sample)
    @subscription5 = create(:subscription, tea: @teas.sample)

    @customer_a.subscriptions << @subscription1
    @customer_a.subscriptions << @subscription2
    @customer_a.subscriptions << @subscription4
  end

  describe "PATCH /update" do
    it 'can change the status of a subscription' do
      post api_v1_subscriptions_path(id: @subscription3, cust_id: @customer_a)
      expect(CustSub.find_by(customer_id: @customer_a, subscription_id: @subscription3).status).to eq("active")

      patch api_v1_cust_sub_path(@subscription3, cust_id: @customer_a, status: "cancelled")

      expect(response).to be_successful
      update_response = JSON.parse(response.body, symbolize_names: true)
      expect(update_response[:message]).to eq("Subscription updated successfully")
      expect(CustSub.find_by(customer_id: @customer_a, subscription_id: @subscription3).status).to eq("cancelled")
    end

    it 'won\'t change the status of a subscription belonging to another customer' do
      post api_v1_subscriptions_path(id: @subscription3, cust_id: @customer_a)
      post api_v1_subscriptions_path(id: @subscription3, cust_id: @customer_b)

      patch api_v1_cust_sub_path(@subscription3, cust_id: @customer_a, status: "cancelled")
      expect(response).to be_successful

      update_response = JSON.parse(response.body, symbolize_names: true)

      expect(update_response[:message]).to eq("Subscription updated successfully")
      expect(CustSub.find_by(customer_id: @customer_a, subscription_id: @subscription3).status).to eq("cancelled")
      expect(CustSub.find_by(customer_id: @customer_b, subscription_id: @subscription3).status).to eq("active")
    end

    it 'will return error message if unable to update due to invalid data' do
      post api_v1_subscriptions_path(id: @subscription3, cust_id: @customer_a)

      patch api_v1_cust_sub_path(@subscription5, cust_id: @customer_a, status: "cancelled")
      expect(response).to be_successful

      update_response = JSON.parse(response.body, symbolize_names: true)

      expect(update_response[:error]).to eq("Unable to update subscription")
    end
  end
end
