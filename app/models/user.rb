class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :projects
  has_many :notes

  before_save :ensure_authentication_token
  after_create :send_welcome_email

  def name
    [first_name, last_name].join(" ")
  end

  geocoded_by :last_sign_in_ip do |user, result|
    if !user.local? && geocode = result.first
      user.location = "#{geocode.city}, #{geocode.state}, #{geocode.country}"
      user.save
    end
  end

  def local?
    ["localhost", "127.0.0.1", "0.0.0.0"].include? last_sign_in_ip
  end

  def after_database_authentication
    GeocodeUserJob.perform_later self
  end

  private

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_later
  end
end
