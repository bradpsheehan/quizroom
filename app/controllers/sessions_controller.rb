class SessionsController < ApplicationController

  def new
  end

  def create
    user = login(params[:email], params[:password])
    if user
      flash[:notice] = "Logged In!"
      redirect_to user_path(user)
    else
      flash.now.alert = "Email or passowrd was invalid."
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:notice] = "Logged Out!"
    redirect_to root_path
  end

end
