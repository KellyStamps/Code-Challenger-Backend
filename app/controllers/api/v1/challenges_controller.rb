class Api::V1::ChallengesController < ApplicationController

  def create
  end

  def show
    challenge = Challenge.find(params[:id])
    render json: {challenge: challenge}
  end

  def index
    challenges = Challenge.all
    render json: {challenges: challenges}
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
