class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create

    @user = User.create
    flash[:notice] = "Signed In!"
    redirect_to @user
  end

  def show

  end


end
