# frozen_string_literal: true

class ApiController < ActionController::Base
  include Response
  include ExceptionHandler

  require "net/http"

  respond_to :json
  prepend_before_action :authenticate_user!
  protect_from_forgery with: :null_session

  protected
    # Removes empty values in an array.
    def sanitize_array(array)
      array.reject!(&:blank?)
    end
end
