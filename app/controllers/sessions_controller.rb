class SessionsController < ApplicationController

  def new
  end

  def create
    user = login(params[:email], params[:password])
    if user
      flash[:notice] = "logged in!"
      redirect_to_back_or_to root_path
    else
      flash.now.alert = "Email or passowrd was invalid."
    end
  end

end
