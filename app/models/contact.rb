class Contact < ActiveRecord::Base
  enum gender: %w(male female)

  belongs_to :user

  validates :email, presence: true, email: true

  acts_as_birthday :birthday

  def self.send_birthday_mail
    contacts = Contact.birthday_today
    contacts.each do |c|
      if c.user.birthday_mail && c.user.check_subscription? && c.activate && !c.unsuscribe_email
        t = c.user.templates.where(birthday: true).first
        email = {subject: t.subject, body: t.body}
        ContactMailer.send_to_contact(c, email, c.user).deliver
        puts "Birthday email send to #{c.inspect} by #{c.user.inspect}"
      end
    end
  end
end
