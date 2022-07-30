# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :validatable

  has_many :referrals

  validates :email, format: URI::MailTo::EMAIL_REGEXP
  before_create :add_referral_code

  # the authenticate method from devise documentation
  def self.authenticate(email, password)
    user = User.find_for_authentication(email: email)
    user&.valid_password?(password) ? user : nil
  end

  def generate_jwt
    JWT.encode({ id: id,
                exp: 60.minutes.from_now.to_i },
               Rails.application.secrets.secret_key_base)
  end

  private
  def add_referral_code
    self.referral_code = SecureRandom.urlsafe_base64(nil, false)
  end
end
