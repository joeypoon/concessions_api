class ApplicationController < ActionController::API
  before_action :authenticate_token

  def current_user
    @current_user ||= User.find_by_token header_token
  end

  private

    def header_token
      request.headers["x-auth-token"]
    end

    def authenticate_token
      if header_token.present?
        unless current_user.present?
          render json: { message: "Invalid token." }, status: 404
        end
      else
        render json: { message: "No token present." }, status: 404
      end
    end
end