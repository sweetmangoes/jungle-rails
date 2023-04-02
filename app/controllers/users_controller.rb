class UsersController < ApplicationController
  
  def new
    if session[:user_id]
      redirect_to "/"
    end 
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.errors.to_hash 
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      # @user.errors.add(:email, "email already been taken")
      render :new
      # redirect_to '/signup'
    end    
  end 

  def show
    @user= User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end