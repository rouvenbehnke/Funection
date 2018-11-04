class RegistrationsController < ApplicationController

  before_filter :no_admin, except: [:create]

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

  def bbq
    render json: Registration.all
  end

  def no_admin
    if current_user.admin != true
      redirect_to homepage_url
    end
  end

  def show
    render json: Registration.find(params[:id])
  end

  def update
    registration = Registration.find(params[:id])
    registration.update(state: params[:registration][:state])
    mail_template(registration)
    render json: registration
  end

  def update_params
    params.require(:update_params).permit(:state)
  end

  def registration_params
    params.require(:form_values).permit(:state, :persons, :first_name, :last_name, :email, :fav_song, :acqu, :acquaintance, :questions, :parts)
  end

  private


  def mail_template(registration)
    case registration.state
    when "confirmed"
      RegistrationNotifier.registration_confirmation(registration).deliver_later
    when "accepted"
      RegistrationNotifier.payment_confirmation(registration).deliver_later
    when "reserved"
      RegistrationNotifier.reserving_confirmation(registration).deliver_later
    else
      ""
    end
  end
end
