class UsersController < ActionController::Base

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = 'Successfully checked in'
			redirect_to @user
		else
			flash[:notice] = "There was something wrong"
		end
	end


	private

	# Rails4 attributes must be marked as required

  def user_params
    params.require(:user).permit(:first_name, :email)
  end

end