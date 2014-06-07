class FriendsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  
  def create
    @user = User.find(params[:friend_id])
    current_user.befriend(@user)
    
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

  def breakup
    @user = User.find(params[:friend_id])
    current_user.breakup_with(@user)
    
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

end