class RegistrationNotifier < ApplicationMailer
  default :from => 'funection@outlook.com'

  def registration_confirmation(registration)
    @registration = registration
    mail( :to => @registration.email,
    :subject => 'Funection Registrierungsbestätigung' )
  end

  def payment_confirmation(registration)
    @registration = registration
    mail( :to => @registration.email,
    :subject => 'Funection Zahlungsbestätigung' )
  end

  def reserving_confirmation(registration)
    @registration = registration
    mail( :to => @registration.email,
    :subject => 'Funection Reservierungsbestätigung' )
  end
end
