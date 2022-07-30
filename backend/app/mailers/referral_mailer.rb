class ReferralMailer < ActionMailer::Base
  default from: 'someone@test.com'
  layout 'emails/empty'

  def referral_mail(referral)
    @referral = referral
    mail from: 'Referral program <no-reply@referral-pgm.com>', to: @referral.user_email, subject: "Invitation to Referral program"
  end
end
