class Api::V1::UserChallengesController < ApplicationController

  def create
    new_user_challenge = UserChallenge.new(user_challenge_params)

    if new_user_challenge.save
      render json: {
        id: new_user_challenge.id,
        user_id: new_user_challenge.user_id,
        challenge: new_user_challenge.challenge,
        created_at: new_user_challenge.created_at.strftime('%A, %B %d, %Y')
      }
    else
      render json: {
        error: 'Something went horribly wrong'
      }
    end
  end

  def update
    challenge = UserChallenge.find(params[:id])
    challenge.update(git_link: params[:git_link], live_link: params[:live_link], completed: true)
    render json: {challenge: challenge}
  end

  def destroy
    UserChallenge.find(params[:id]).destroy
    render json: {id: params[:id]}
  end

  private
  def user_challenge_params
    params.require(:user_challenge).permit(:user_id, :challenge_id)
  end

end
