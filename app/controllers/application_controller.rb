class ApplicationController < ActionController::API

  private

  def encode payload
    JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256')
  end

  def decode
    if request.headers['Authorization']
        begin
          JWT.decode(request.headers['Authorization'], Rails.application.secrets.secret_key_base, true, {algorithm: "HS256"})
        rescue JWT::DecodeError
          return [{}]
        end
      else
        [{}]
      end
  end

  def authorize_user!
      if !find_current_user.present?
        render json: {error: 'No user id present'}
      end
    end

  def current_user
    !!@current_user ||= User.find_by(id: decode.first[:id])
  end

  def find_current_user
    @current_user ||= User.find_by(id: decode.first['id'])
  end

end
