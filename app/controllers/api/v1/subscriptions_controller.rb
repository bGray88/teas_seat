class Api::V1::SubscriptionsController < ApplicationController
  before_action :find_customer, only: [:create, :index]
  before_action :find_subscription, only: [:create]

  def index
    render json: SubscriptionSerializer.subscriptions(@customer.subscriptions)
  end

  def create
    @customer.subscriptions << @subscription
    render json: SubscriptionSerializer.subscription(@subscription)
  end

  private

  def find_customer
    @customer = Customer.find_by(id: params[:cust_id])
  end

  def find_subscription
    @subscription = Subscription.find_by(id: params[:id])
  end
end
