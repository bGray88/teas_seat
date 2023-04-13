class ApplicationController < ActionController::API
  rescue_from StandardError::TeaError, with: :error_response_tea

  def error_response_tea(error)
    render json: ErrorSerializer.error_json(error), status: error.status
  end
end
