require 'rails_helper'

RSpec.describe CustSub, type: :model do
  before(:each) do
    @customer     = create(:customer)
    @tea          = create(:tea)
    @subscription = create(:subscription, tea: @tea)
    @customer.subscriptions << @subscription
  end

  it { should belong_to(:customer) }
  it { should belong_to(:subscription) }
  it { should validate_presence_of(:status) }

  it 'exists and has attributes' do
    expect(CustSub.last).to eq(CustSub.find_by(customer_id: @customer, subscription_id: @subscription))
  end
end
