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

  describe 'instance methods' do
    describe 'valid_status' do
      it 'checks value for valid status' do
        valid1  = "active"
        valid2  = "cancelled"
        invalid = "unicorn"

        expect(CustSub.valid_status(valid1)).to be(true)
        expect(CustSub.valid_status(valid2)).to be(true)
        expect(CustSub.valid_status(invalid)).to be(false)
      end
    end
  end
end
