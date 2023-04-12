class Api::V1::SubscriptionsController < ApplicationController
  before_action :find_customer, only: [:create, :index]

  def index
    render json: @customer.subscriptions
  end

  def create
    @customer.subscriptions.create!(params[])
  end

  private

  def find_customer
    @customer = Customer.find_by(id: params[:cust_id])
  end

  def find_subscription
    @subscription = Subscription.find_by(id: params[:sub_id])
  end
end
