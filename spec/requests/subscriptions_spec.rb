require 'rails_helper'

RSpec.describe "Subscriptions", type: :request do
  before(:each) do
    @customer      = create(:customer)
    @teas          = create_list(:tea, 10)
    @subscription1 = create(:subscription, tea: @teas.sample)
    @subscription2 = create(:subscription, tea: @teas.sample)
    @subscription3 = create(:subscription, tea: @teas.sample)
    @subscription4 = create(:subscription, tea: @teas.sample)

    @customer.subscriptions << @subscription1
    @customer.subscriptions << @subscription2
    @customer.subscriptions << @subscription4
  end

  describe "GET /index" do
    it 'can get customer subscriptions' do
      get api_v1_subscriptions_path(cust_id: @customer)
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
      post api_v1_subscriptions_path(id: @subscription3, cust_id: @customer)
      expect(response).to be_successful

      cust_subscription = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(cust_subscription).to be_a(Hash)
      expect(cust_subscription.dig(:attributes, :frequency)).to eq(@subscription3.frequency)
      expect(cust_subscription.dig(:attributes, :price)).to eq(@subscription3.price)
      expect(cust_subscription.dig(:attributes, :title)).to eq(@subscription3.title)
    end
  end
end
