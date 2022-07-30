# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApiController
      include DeviseRegisterable
      before_action :current_api_v1_user
      respond_to    :json

      # GET /me.json
      def me
        if @current_api_v1_user.nil?
          render json: { error: 'Not Authorized' }, status: :unauthorized
        else
          render json: render_user(@current_api_v1_user), status: :ok
        end
      end
    end
  end
end
