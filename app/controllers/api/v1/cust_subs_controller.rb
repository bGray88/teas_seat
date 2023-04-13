class Api::V1::CustSubsController < ApplicationController
  before_action :find_customer_subscription, only: [:update]
  before_action :find_customer, only: [:index, :create]
  before_action :find_subscription, only: [:create]

  def index
    render json: SubscriptionSerializer.subscriptions(@customer.subscriptions)
  end

  def create
    @customer.subscriptions << @subscription
    render json: SubscriptionSerializer.subscription(@subscription)
  end

  def update
    if @cust_sub
      @cust_sub.update(status: params[:status])
      render json: { message: "Subscription updated successfully" }
    else
      render json: { error: "Unable to update subscription" }
    end
  end

  private

  def cust_sub_params
    params.require(:cust_sub).permit(
      :id
    )
  end

  def customer_params
    params.require(:customer).permit(
      :customer_id
    )
  end

  def subscription_params
    params.require(:subscription).permit(
      :subscription_id
    )
  end

  def find_customer
    @customer = Customer.find_by(id: customer_params[:customer_id])
  end

  def find_subscription
    @subscription = Subscription.find_by(id: subscription_params[:subscription_id])
  end

  def find_customer_subscription
    @cust_sub = CustSub.find_by(id: cust_sub_params[:id])
  end
end
