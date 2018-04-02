class Api::V1::AuthController < ApplicationController
  before_action :authorize_user!, only: [:show]

  def show

    user = find_current_user

    if find_current_user.user_challenges
      favorites = find_current_user.user_challenges.map { |c| {id: c.id, challenge: c.challenge, completed: c.completed, git_link: c.git_link, live_link: c.live_link}}
    else
      favorites = []
    end

    if find_current_user.friendships
      friends = find_current_user.friendships.map {|fr| {id: fr.id, friend: fr.friend}}
    else
      friends = []
    end

    render json: {
      username: find_current_user.username,
      cake_day: find_current_user.created_at.strftime('%A, %B %d, %Y'),
      id: find_current_user.id,
      bio: find_current_user.bio,
      favorites: favorites,
      friends: friends
    }
  end

  def create
    user = User.find_by(username: params[:username])
    if user.present? && user.authenticate(params[:password])
      jwt = encode(id: user.id)

      if user.user_challenges
        favorites = user.user_challenges.map { |c| {id: c.id, challenge: c.challenge, completed: c.completed, git_link: c.git_link, live_link: c.live_link}}
      else
        favorites = []
      end

      if user.friendships
        friends = user.friendships.map {|fr| {id: fr.id, friend: fr.friend}}
      else
        friends = []
      end

      render json: { user: {
        username: user.username,
        cake_day: user.created_at.strftime('%A, %B %d, %Y'),
        id: user.id,
        bio: user.bio,
        favorites: favorites,
        friends: friends},
        jwt: jwt
      }
    else
      render json: {error: "Something went terribly wrong"}, status: 404
    end
  end

end
