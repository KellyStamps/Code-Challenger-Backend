class Api::V1::AuthController < ApplicationController

  def show
    user = find_current_user

    projects = user.user_challenges.map {|uc| {id: uc.id, title: uc.challenge.content, project: uc}}

    render json: {user: {username: user.username, id: user.id, bio: user.bio, projects: projects}}
  end

  def create
    user = User.find_by(username: params[:username])
    if user.present? && user.authenticate(params[:password])
      jwt = encode(id: user.id)
      projects = user.user_challenges.map {|uc| {id: uc.id, title: uc.challenge.content, project: uc}}
      render json: {user: {username: user.username, id: user.id, bio: user.bio, projects: projects}, jwt: jwt}
    else
      render json: {error: "Something went terribly wrong"}, status: 404
    end
  end

end
