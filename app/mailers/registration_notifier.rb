class RegistrationNotifier < ApplicationMailer
  default :from => 'funection@outlook.com'

  def registration_confirmation(registration)
    @registration = registration
    mail( :to => @registration.email,
    :subject => 'Funection Registrierung Bestätigung' )
  end

  def payment_confirmation(registration)
    @registration = registration
    mail( :to => @registration.email,
    :subject => 'Funection Zahlungsbestätigung' )
  end

  def reject_confirmation(registration)
    @registration = registration
    mail( :to => @registration.email,
    :subject => 'Funection Absage Bestätigung' )
  end

end
