class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user.authenticate(params[:password]) && user.admin?
      session[:user_id] = user.id
      redirect_to admin_user_path(user)
    elsif user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
