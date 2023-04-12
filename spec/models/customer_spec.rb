require 'rails_helper'

RSpec.describe Customer, type: :model do
  before(:each) do
    @customer = create(:customer)
  end

  it { should have_many(:subscriptions) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:address) }

  it 'exists and has attributes' do
    expect(@customer).to be_a(Customer)
  end
end
