class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user_attributes = params[:user]
    password = user_attributes.delete(:password)
    password_confirmation = user_attributes.delete(:password_confirmation)
    @user = User.create(user_attributes)
    flash[:notice] = "Signed In!"
    redirect_to @user
  end

  def show

  end


end
