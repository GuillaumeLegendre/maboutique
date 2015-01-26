class Contact < ActiveRecord::Base
  enum gender: %w(male female)

  belongs_to :user

  validates :email, presence: true, email: true
end
