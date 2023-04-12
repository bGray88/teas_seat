class Api::V1::CustSubsController < ApplicationController
  before_action :find_customer_subscription, only: [:update]

  def update
    if @cust_sub
      @cust_sub.update(status: params[:status])
      render json: { message: "Subscription updated successfully" }
    else
      render json: { error: "Unable to update subscription" }
    end
  end

  private

  def find_customer_subscription
    @cust_sub = CustSub.find_by(customer_id: params[:cust_id], subscription_id: params[:id])
  end
end
