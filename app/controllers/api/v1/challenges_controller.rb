class Api::V1::ChallengesController < ApplicationController

  def create
    challenge = Challenge.new(content: params[:content], links: params[:links], rating: 10)

    if challenge.save
      render json: {challenge: challenge}
    else
      render json: {message: "Error!"}
    end
  end

  def show
    challenge = Challenge.find(params[:id])
    render json: {challenge: challenge}
  end

  def index
    challenges = Challenge.all

    lazy_links = UserChallenge.all.select{ |uc| uc.completed === true }.map{ |c| {id: c.challenge.id, git_link: c.git_link, live_link: c.live_link, user: c.user}}

    users = User.all
    allUsers = users.map { |user|
      projects = user.user_challenges.map { |uc| {id: uc.id, title: uc.challenge.content, project: uc}  }
      {user: user, projects: projects}
    }
    render json: {challenges: challenges, allUsers: allUsers, lazy_links: lazy_links}
  end

  def update
    challenge = Challenge.find(params[:id])
    challenge.rating = params[:rating]
    challenge.save
    render json: {rating: challenge.rating}
  end

  def destroy
  end

end
