require 'rails_helper'

RSpec.describe Tea, type: :model do
  before(:each) do
    @tea = create(:tea)
  end

  it { should have_many(:subscriptions) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:temperature) }
  it { should validate_presence_of(:brew_time) }

  it 'exists and has attributes' do
    expect(@tea).to be_a(Tea)
  end
end
