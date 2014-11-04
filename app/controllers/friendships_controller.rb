class FriendshipsController < ApplicationController

  def show
  end

  def create
    user = User.find(params[:friend_id])
    @friendship = Friendship.new(friend_id: user.id, state: "pending")
    if @friendship.save
      flash[:notice] = "Request sent!"
      redirect_to root_path
    else
      flash[:notice] = "Unable to send request."
      redirect_to user_path(user)
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Succesfully deleted relationship"
    redirect_to current_user
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.state = params[:state]
    @friendship.save!
    flash[:notice] = "Mentorship approved"
    redirect_to users_path
  end

end
