# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def follow
    @user = User.find(params[:id])
    current_user.followings << @user
    redirect_to @user
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.followings.delete(@user)
    redirect_to @user
  end
end
