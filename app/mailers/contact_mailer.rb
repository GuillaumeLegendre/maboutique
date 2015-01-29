class ContactMailer < ActionMailer::Base
  def send_to_contact(contact, email, user)
    mail subject: email[:subject],
         to: contact.email,
         from: user.email,
         body: email[:body],
         content_type: "text/html"
  end
end