# frozen_string_literal: true

module Api
  module V1
    class ReferralsController < ApiController
      def create
        @referral = Referral.new(referral_params)
        @referral.referral_email = params[:email]
        @referral.user = User.find_by(email: params[:email])
        respond_to do |format|
          format.html do
            if @referral.save
              render json: { email: @referral.user_email }, status: :ok
            else
              render json: @referral.errors, status: :unprocessable_entity
            end
          end
        end
      end

      private

      def referral_params
        params.require(:referral).permit(:user_name, :user_email, :email_body, :email)
      end
    end
  end
end
