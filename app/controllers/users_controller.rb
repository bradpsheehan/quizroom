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

  def complete_signup
    @user = User.find(params[:id])
    @class_id = params[:class_id]
  end

  def update
    @user = User.find(params[:id])
    @user.update_with_password(params[:user])
    if @user.save
      flash[:notice] = "Account creation successful"
      destination = classroom_path(params[:redirect]) || root_path
      redirect_to destination
    else
      render :complete_signup
    end
  end

  def show
    @disable_side_nav = true
  end


end
