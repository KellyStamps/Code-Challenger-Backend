class Api::V1::UsersController < ApplicationController

  def create
    user = User.find_by(username: params[:username])

    if user
      favorites = UserChallenge.select{|challenge| challenge.user_id == user.id}
      render json: {
        username: user.username,
        cake_day: user.created_at.strftime('%A, %B %d, %Y'),
        id: user.id,
        bio: user.bio,
        favorites: favorites
      }
    else
      new_user = User.new(user_params)

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

  private

    def user_params
      params.require(:user).permit(:username, :password, :bio)
    end

end
