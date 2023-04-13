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

  describe "PATCH /update" do
    it 'can change the status of a subscription' do
      cust_sub = CustSub.create(customer_id: @customer1.id, subscription_id: @subscription3.id)

      payload = {
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
      payload = {
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
