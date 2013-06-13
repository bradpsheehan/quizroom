class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user_attributes = params[:user]
    @user = User.create_with_password(user_attributes)

    if @user.valid?
      flash[:notice] = "Signup Successful!"
      redirect_to @user
    else
      flash[:notice] = "Invalid information"
      redirect_to signup_path
    end
  end

  def show

  end


end
