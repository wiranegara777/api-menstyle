class ApplicationController < ActionController::API
  rescue_from CustomError, with: :handle_custom_error

  private

  def handle_custom_error(exception)
    render json: {
        error: exception.error,
        message: exception.message,
        status: exception.status
    }
  end
end
