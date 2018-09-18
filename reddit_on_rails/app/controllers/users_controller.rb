class UsersController < ApplicationController
  before_action :find_user, only: [:show]
  
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else 
      now_errors(@user)
      render :new
    end 
  end
  
  def show 
    render :show
  end 
  
  private 
  
  def user_params
    params.require(:user).permit(:username, :password)
  end 
  
  def find_user
    @user = User.find(params[:id])
  end 
  
end
