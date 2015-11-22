class RegistrationsController < ApplicationController
	def new
    @registration = Registration.new
  end

	def create
    @registration = Registration.new(registration_params)
    if @registration.save
      redirect_to homepage_url , :notice => "Deine Anmeldung wurde erfolgreich abgeschickt"
    else
      render 'new'
    end
  end

  def registration_params
    params.require(:form_values).permit(:first_name, :last_name, :email, :fav_song, :acqu, :acquaintance, :questions)
  end
end

