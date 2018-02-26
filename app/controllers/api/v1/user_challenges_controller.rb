class Api::V1::UserChallengesController < ApplicationController

  def create
    new_user_challenge = UserChallenge.new(user_challenge_params)

    if new_user_challenge.save
      render json: {
        user_id: new_user_challenge.user_id,
        challenge_id: new_user_challenge.challenge_id,
        created_at: new_user_challenge.created_at.strftime('%A, %B %d, %Y')
      }
    else
      render json: {
        error: 'Something went horribly wrong'
      }
    end
  end

  def destroy
  end

  private
  def user_challenge_params
    params.require(:user_challenge).permit(:user_id, :challenge_id)
  end

end
