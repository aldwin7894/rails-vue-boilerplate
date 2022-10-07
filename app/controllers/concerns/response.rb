# frozen_string_literal: true

module Response
  extend ActiveSupport::Concern

  def json_response(object, status: :ok, root: "data", serializer: nil)
    if serializer.present?
      render json: object, status: status, root: root, serializer: serializer
    else
      render json: object, status:, root:
    end
  end
end
