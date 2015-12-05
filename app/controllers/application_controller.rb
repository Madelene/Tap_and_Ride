class ApplicationController < ActionController::API
  def current_user
    @current_user ||= User.find_by(auth_token: params['auth'])
  end
  def authenticate_with_token!
    render json: { errors: "Not authenticated" },
                status: :unauthorized unless current_user.present?
  end
   def user_signed_in?
    current_user.present?
  end
end
