class Api::V1::ChallengesController < ApplicationController

  def new
  end

  def create
  end

  def show
  end

  def index
    challenges = Challenge.all
    render json: {challenges: challenges}
  end

  def destroy
  end

end
