class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user_attributes = params[:user]
    @user = User.create_with_password(user_attributes)

    flash[:notice] = "Signup Successful!"
    redirect_to @user
  end

  def show

  end


end
