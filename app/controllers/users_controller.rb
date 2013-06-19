class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user_attributes = params[:user]
    @user = Teacher.create_with_password(user_attributes)

    if @user.valid?
      flash[:notice] = "Signup Successful!"
      auto_login(@user)
      redirect_to user_path(@user)
    else
      flash[:notice] = "Invalid information"
      redirect_to signup_path
    end
  end

  def show
    @disable_side_nav = true
  end


end
