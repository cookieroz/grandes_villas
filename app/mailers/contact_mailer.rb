class ContactMailer < ActionMailer::Base
  default from: "rentals@grandesvillas.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_confirmation.subject
  #
  #def receive(email)
  #  page = Page.find_by_address(email.to.first)
  #  page.emails.create(
  #      :subject => email.subject,
  #      :body => email.body
  #  )

    #if email.has_attachments?
    #  email.attachments.each do |attachment|
    #    page.attachments.create({
    #                                :file => attachment,
    #                                :description => email.subject
    #                            })
    #  end
    #end
 # end


  def contact_confirmation(message)
    @message = message

    mail to: message.email, subject: "Grandes Villas Request"
  end

  def inquiry(message)
    @message = message

    mail to: "carlosdiezvillar@gmail.com", subject: "New Inquiry from GrandesVillas.com"
  end
end
