class Api::V1::UsersController < ApplicationController

  def create
    user = User.find_by(username: params[:username])

    if user
      favorites = user.user_challenges.map { |c| {id: c.id, challenge: c.challenge, completed: c.completed, git_link: c.git_link}}

      render json: {
        username: user.username,
        cake_day: user.created_at.strftime('%A, %B %d, %Y'),
        id: user.id,
        bio: user.bio,
        favorites: favorites
      }
    else
      user = User.new(username: params[:username], password: params[:password])
      if user.save
        render json: {
          username: user.username,
          cake_day: user.created_at,
          id: user.id,
          bio: user.bio,
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
    user = User.find(params[:id])
    if !params[:bio].empty?
      user.update(bio: params[:bio])
    end
    if !params[:username].empty?
      user.update(username: params[:username])
    end
    render json: {user: user}
  end

  # private
  #
  #   def user_params
  #     params.require(:user).permit(:username, :password)
  #   end

end
