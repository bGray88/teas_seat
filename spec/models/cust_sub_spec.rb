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

  it 'exists and has attributes' do
    expect(@customer.subscriptions[0]).to be_a(Subscription)
  end
end
