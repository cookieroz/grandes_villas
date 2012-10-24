class ContactMailer < ActionMailer::Base
  default from: "rentals@grandesvillas.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_confirmation.subject
  #
  def contact_confirmation(message)
    @message = message

    mail to: message.email, subject: "Grandes Villas Request"
  end
end
