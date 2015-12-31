class HomepageController < ActionController::Base
	before_filter :no_current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def no_current_user
  	if session[:user_id].nil?
  	  redirect_to login_url
  	end
  end

	def index
	end

  def show

  end
end