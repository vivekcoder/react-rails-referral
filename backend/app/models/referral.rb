# frozen_string_literal: true

class Referral < ApplicationRecord
  belongs_to :user

  after_create_commit :send_email

  private
  def send_email
    ReferralMailer.referral_mail(self).deliver_now
  end
end
