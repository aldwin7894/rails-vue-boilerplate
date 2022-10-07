# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token
  respond_to :json

  private
    def respond_with(resource, _opts = {})
      token = if request.headers["warden-jwt_auth.token"].present?
                {
                  token: "Bearer #{request.headers['warden-jwt_auth.token']}",
                  expiration: 4.hours.to_i
                }
              end
      render json: {
        success: true,
        message: "Logged in successfully.",
        data: token
      }, status: :ok
    end

    def respond_to_on_destroy
      current_user ? log_out_success : log_out_failure
    end

    def log_out_success
      render json: { message: "Logged out successfully." }, status: :ok
    end

    def log_out_failure
      render json: { message: "Logging out was not successful." }, status: :unauthorized
    end
end
