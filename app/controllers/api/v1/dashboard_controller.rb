# frozen_string_literal: true

module Api
  module V1
    class DashboardController < ApiController
      def index
        render json: {
          success: true,
          message: "Welcome to API"
        }
      end
    end
  end
end
