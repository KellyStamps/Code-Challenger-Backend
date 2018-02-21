class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(username: params[:username], password: params[:password])

    if user.save
      render json: {
        username: user.username,
        cake_day: user.created_at,
        id: user.id
      }
    else
      render json: {
        error: 'Something went horribly wrong'
      }
    end
  end

  def show
    user = User.find_by(username: params[:id])
  end

  def index
    users = User.all
    render json: {
      users: users 
    }
  end

  def edit
  end

  def update
  end

end
