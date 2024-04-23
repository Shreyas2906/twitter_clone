# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = if params[:q]
               User.where("email LIKE ?", "%#{params[:q]}%")
             else
               User.all
             end
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user) unless current_user.following?(@user)
    redirect_to root_path
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow(@user) if current_user.following?(@user)
    redirect_to root_path
  end
  
  def search
    @users = User.where("email LIKE ?", "%#{params[:q]}%")
    render :index
  end

end
