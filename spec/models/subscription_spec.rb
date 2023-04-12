require 'rails_helper'

RSpec.describe Subscription, type: :model do
  before(:each) do
    @customer     = create(:customer)
    @tea          = create(:tea)
    @subscription = create(:subscription, tea: @tea)
  end

  it { should have_many(:customers).through(:cust_subs) }
  it { should have_many(:cust_subs) }
  it { should belong_to(:tea) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:frequency) }

  it 'exists and has attributes' do
    expect(@subscription).to be_a(Subscription)
  end
end
