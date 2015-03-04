class ContactMailer < ActionMailer::Base
  def send_to_contact(contact, email, user)
    mail subject: email[:subject],
         to: contact.email,
         from: "no-reply@maboutique.pro",
         body: email[:body],
         content_type: "text/html",
         reply_to: user.email
  end
end
