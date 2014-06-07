class UsersController < ApplicationController
  before_action :signed_in_user, except: [:new, :create, :show]
  before_action :find_user, except: [:new, :create, :show, :unblock_all_users]

  def show
    @user = User.find(params[:id])
    @messages = @user.messages
    @friends = @user.friends
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome #{@user.name}"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Update successful for #{@user.name}"
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def block
    @user.ban(current_user)

    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

  def unblock
    @user.unban

    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

  def unblock_all_users
    User.unscoped.update_all(blocked: false)

    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
