class ApplicationController < ActionController::API

  def authenticate_user!
    if payload.nil?
      render json: { error: "Invalid Request"}, status: :unauthorized
    end
    if !payload.nil?
      load_current_user!
      render json: { error: "Invalid Request"}, status: :unauthorized unless @current_user
    end
  end

  def payload
    headers = request.headers['Authorization']
    user_token = JWT.decode(request.headers['Authorization'], Rails.application.secrets.secret_key_base)
  rescue
    nil
  end

  def load_current_user!
    if payload
      @current_user = User.find_by(id: payload[0]['user_id'])
    end
  end
end
