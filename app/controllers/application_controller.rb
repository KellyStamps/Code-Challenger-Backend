class ApplicationController < ActionController::API

  def encode payload
    JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256')
  end

  def decode
    if request.headers['Authorization']
      JWT.decode(request.headers['Authorization'], Rails.application.secrets.secret_key_base, true, 'HS256')
    else
      [{}]
    end
  end

  def current_user
    !!@user ||= User.find_by(id: decode.first[:id])
  end

  def find_current_user
    @user ||= User.find_by(id: decode.first[:id])
  end

end
