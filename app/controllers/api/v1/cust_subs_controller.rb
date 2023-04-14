class Api::V1::CustSubsController < ApplicationController
  before_action :find_customer_subscription, only: [:update]
  before_action :find_customer, only: [:index, :show, :create]
  before_action :find_subscription, only: [:show, :create]

  def index
    subscriptions = SubscriptionFacade.subscriptions(@customer, @customer.subscriptions)
    render json: SubscriptionSerializer.subscriptions(subscriptions)
  end

  def show
    cust_sub = CustSub.find_by(customer_id: @customer.id, subscription_id: @subscription.id)
    raise TeaError.new({ details: "Customer Subscription not found", status: 404 }) unless cust_sub
    render json: CustSubSerializer.cust_sub(cust_sub)
  end

  def create
    @customer.subscriptions << @subscription
    subscription = SubscriptionFacade.subscription(@customer, @subscription)
    render json: SubscriptionSerializer.subscription(subscription)
  end

  def update
    raise TeaError.new({ details: "Status given is invalid" }) unless CustSub.valid_status(params[:status])

    @cust_sub.update(status: params[:status])
    render json: { message: "Subscription updated successfully" }
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
    raise TeaError.new({ details: "Customer not found", status: 404 }) unless @customer
  end

  def find_subscription
    @subscription = Subscription.find_by(id: subscription_params[:subscription_id])
    raise TeaError.new({ details: "Subscription not found", status: 404 }) unless @subscription
  end

  def find_customer_subscription
    @cust_sub = CustSub.find_by(id: cust_sub_params[:id])
    raise TeaError.new({ details: "Customer Subscription not found", status: 404 }) unless @cust_sub
  end
end
