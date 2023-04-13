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
      get api_v1_cust_subs_path(@customer), headers: @headers, params: payload
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

  describe "POST /create" do
    it 'can assign user a subscription' do
      payload = {
        customer_id: @customer1.id,
        customer: { customer_id: @customer1.id },
        subscription: { subscription_id: @subscription3.id }
      }
      post api_v1_cust_subs_path(payload), headers: @headers
      expect(response).to be_successful

      cust_subscription = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(cust_subscription).to be_a(Hash)
      expect(cust_subscription.dig(:attributes, :frequency)).to eq(@subscription3.frequency)
      expect(cust_subscription.dig(:attributes, :price)).to eq(@subscription3.price)
      expect(cust_subscription.dig(:attributes, :title)).to eq(@subscription3.title)
    end
  end

  describe "PATCH /update" do
    it 'can change the status of a subscription' do
      cust_sub = CustSub.create(customer_id: @customer1.id, subscription_id: @subscription3.id)
      payload = {
        id: cust_sub.id,
        customer_id: @customer1.id,
        cust_sub: { id: cust_sub.id },
        status: "cancelled"
      }
      expect(cust_sub.status).to eq("active")

      patch api_v1_cust_sub_path(payload), headers: @headers

      expect(response).to be_successful
      update_response = JSON.parse(response.body, symbolize_names: true)
      expect(update_response[:message]).to eq("Subscription updated successfully")
      expect(CustSub.find_by(customer_id: @customer1, subscription_id: @subscription3).status).to eq("cancelled")
    end

    it 'won\'t change the status of a subscription belonging to another customer' do
      cust_sub1 = CustSub.create(customer_id: @customer1.id, subscription_id: @subscription3.id)
      cust_sub2 = CustSub.create(customer_id: @customer2.id, subscription_id: @subscription3.id)

      payload = {
        id: cust_sub1.id,
        customer_id: @customer1.id,
        cust_sub: { id: cust_sub1.id },
        status: "cancelled"
      }

      patch api_v1_cust_sub_path(payload), headers: @headers
      expect(response).to be_successful
      cust_sub1.reload

      update_response = JSON.parse(response.body, symbolize_names: true)

      expect(update_response[:message]).to eq("Subscription updated successfully")
      expect(cust_sub1.status).to eq("cancelled")
      expect(cust_sub2.status).to eq("active")
    end

    it 'will return error message if unable to update due to invalid data' do
      cust_sub1 = CustSub.create(customer_id: @customer1.id, subscription_id: @subscription3.id)
      payload = {
        id: cust_sub1.id,
        customer_id: @customer1.id,
        cust_sub: { id: 55 },
        status: "cancelled"
      }

      patch api_v1_cust_sub_path(payload), headers: @headers
      expect(response).to be_successful

      update_response = JSON.parse(response.body, symbolize_names: true)

      expect(update_response[:error]).to eq("Unable to update subscription")
    end
  end
end
