class UsersController < ActionController::Base

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to homepage_url , :notice => "Du hast dich erfolgreich angemeldet"
    else
      render 'new'
    end
  end

  private

  # Rails4 attributes must be marked as required

  def user_params
    params.require(:user).permit(:password, :email)
  end

end