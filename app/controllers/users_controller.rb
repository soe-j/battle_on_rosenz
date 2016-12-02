class UsersController < ApplicationController
  protect_from_forgery except: [:create]

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create(user_params)
    sign_in @user
    render json: @user
  end

private
  def user_params
    params.require(:user).permit(:name, :color)
  end

end
