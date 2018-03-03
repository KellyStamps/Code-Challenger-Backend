class Api::V1::FriendshipsController < ApplicationController

  def create
    if params.include?(:friend_id)
      Friendship.create_reciprocal_for_ids(params[:user_id], params[:friend_id])
    end
    render json: {friendship: Friendship.last}
  end

  def destroy
  end

end
