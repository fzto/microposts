class UsersController < ApplicationController
  before_action :set_profile, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Your profile has been updated."
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def followings
   @user = User.find(params[:id])
   @followings = @user.following_users
  end
  
  def followers
   @user = User.find(params[:id])
   @followers = @user.follower_users
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile, :location, :url)
  end
  
  def set_profile
    @user = User.find(params[:id])
  end
  
end
