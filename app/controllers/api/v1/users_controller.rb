class Api::V1::UsersController < ApplicationController

  def create
    user = User.find_by(username: params[:username])

    if user
      render json: {
        username: user.username,
        cake_day: user.created_at,
        id: user.id,
        bio: user.bio
      }
    else
      new_user = User.new(username: params[:username], password: params[:password])

      if new_user.save
        render json: {
          username: user.username,
          cake_day: user.created_at,
          id: user.id,
          bio: user.bio
        }
      else
        render json: {
          error: 'Something went horribly wrong'
        }
      end
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
