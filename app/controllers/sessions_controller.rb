class SessionsController < ApplicationController
	skip_before_filter :no_current_user

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to homepage_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

  def new
    if session[:user_id].present?
      redirect_to homepage_url
    else
      render
    end
  end
end