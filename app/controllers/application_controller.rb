class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :no_current_user
  skip_before_filter :verify_authenticity_token



  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def no_current_user
  	if current_user.nil?
  	  redirect_to login_url
  	end
  end

  helper_method :current_user
end
