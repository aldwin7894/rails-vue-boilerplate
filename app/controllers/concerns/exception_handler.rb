# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  # Define custom error subclasses - rescue catches `StandardErrors`
  class AuthenticationError < StandardError; end
  class MissingToken        < StandardError; end
  class InvalidToken        < StandardError; end
  class InsufficientPoints  < StandardError; end
  class Unavailable         < StandardError; end
  class Forbidden           < StandardError; end
  class GeneralError        < StandardError; end
  class MissingParameter    < StandardError; end
  class InternalServerError < StandardError; end

  included do
    # Define custom handlers
    rescue_from ActiveRecord::RecordInvalid,           with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized
    rescue_from ExceptionHandler::MissingToken,        with: :unauthorized
    rescue_from ExceptionHandler::InvalidToken,        with: :unauthorized
    rescue_from ExceptionHandler::Unavailable,         with: :not_found
    rescue_from ActionController::RoutingError,        with: :not_found
    rescue_from ActiveRecord::RecordNotFound,          with: :not_found
    rescue_from ExceptionHandler::Forbidden,           with: :forbidden
    rescue_from ExceptionHandler::GeneralError,        with: :four_twenty_two
    rescue_from ExceptionHandler::MissingParameter,    with: :four_twenty_two
    rescue_from ExceptionHandler::InternalServerError, with: :five_hundred
    rescue_from Exception,                             with: :five_hundred
  end

  private
    # JSON response with message; Status code 500 - Internal Server Error
    def five_hundred(e)
      json_response({
        success: false,
        message: e.message,
        data: e
      }, status: :internal_server_error)
    end

    # JSON response with message; Status code 422 - unprocessable entity
    def four_twenty_two(e)
      json_response({
        success: false,
        message: e.message,
        data: e
      }, status: :unprocessable_entity)
    end

    # JSON response with message; Status code 404 - not found
    def not_found(e)
      json_response({
        success: false,
        message: e.message,
        data: e
      }, status: :not_found)
    end

    # JSON response with message; Status code 403 - Forbidden
    def forbidden(e)
      json_response({
        success: false,
        message: e.message,
        data: e
      }, status: :forbidden)
    end

    # JSON response with message; Status code 401 - Unauthorized
    def unauthorized(e)
      json_response({
        success: false,
        message: e.message,
        data: e
      }, status: :unauthorized)
    end
end
