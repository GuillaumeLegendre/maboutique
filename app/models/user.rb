class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :phone, presence: true

  has_many :contacts
  has_many :templates
  has_many :images

  def check_subscription?
    Date.today >= self.end_subscription
  end
end
