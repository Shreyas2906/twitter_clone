# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def search
    @users = User.where("email LIKE ?", "%#{params[:q]}%")
    render :index
  end
end
