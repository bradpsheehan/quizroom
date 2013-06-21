class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user_attributes = params[:user]
    @user = User.create_with_password(user_attributes)

    if @user.valid?
      flash[:notice] = "Signup Successful!"
      auto_login(@user)
      redirect_to @user
    else
      flash[:notice] = "Invalid information"
      redirect_to signup_path
    end
  end

  def complete_signup
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_with_password(params[:user])
    if @user.save
      flash[:notice] = "Account creation successful"
      redirect_to root_path
    else
      render :complete_signup
    end
  end

  def show

  end


end
