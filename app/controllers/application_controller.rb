class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  
  private
    def record_not_found
      render json: {message: "No Resource"}, status: 404
    end
end
