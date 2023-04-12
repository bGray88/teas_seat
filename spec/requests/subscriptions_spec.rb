require 'rails_helper'

RSpec.describe "Subscriptions", type: :request do
  before(:each) do
    @customers     = create_list(:customer, 3)
    @teas          = create_list(:tea, 10)
    @subscription1 = create(:subscription, tea: @teas.sample)
    @subscription2 = create(:subscription, tea: @teas.sample)
    @subscription3 = create(:subscription, tea: @teas.sample)
    @subscription4 = create(:subscription, tea: @teas.sample)
    @subscription5 = create(:subscription, tea: @teas.sample)
  end

  describe "GET /index" do
    it 'can get subscriptions' do
      get api_v1_subscriptions_path(cust_id: @customers.sample, sub_id: @subscription3)

      expect(response).to be_successful

      cust_subscriptions = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
