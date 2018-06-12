class FriendshipsController < ApplicationController

  def destroy
    @friendship = current_user.friendships.where(friend_id: params[:id]).first
    @friendship.destroy
    flash[:success] = "You are not longer friends.."
    redirect_to my_friends_path
  end

end