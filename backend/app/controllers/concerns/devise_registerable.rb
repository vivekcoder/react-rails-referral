# frozen_string_literal: true

module DeviseRegisterable
  extend ActiveSupport::Concern

  def render_user(user, token_type = 'Bearer')
    access_token = user.generate_jwt

    {
      id: user.id,
      email: user.email,
      access_token: access_token,
      token_type: token_type,
      created_at: user.created_at.iso8601
    }
  end

  def referred_mails(user)
    @referrals = user.referrals.map { |r|
      {
        id: r.id,
        user_name: r.user_name,
        user_email: r.user_email
      }
    }
    {
      referrals: @referrals
    }
  end
end
