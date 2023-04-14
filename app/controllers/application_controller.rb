class ApplicationController < ActionController::API
  rescue_from StandardError::TeaError, with: :error_response_tea
  rescue_from ActiveRecord::RecordInvalid, with: :error_validation

  def error_response_tea(error)
    render json: ErrorSerializer.error_json(error), status: error.status
  end

  def error_validation(error)
    render json: ErrorSerializer.error_json(TeaError.new(details: error.message)), status: :bad_request
  end
end
