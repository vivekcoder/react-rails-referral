# frozen_string_literal: true

class ApiController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_api_v1_user!
  skip_before_action :verify_authenticity_token

  # Set response type
  respond_to :json

  def authenticate_user
    if params[:token].present?
      jwt_payload = JWT.decode(params[:token], Rails.application.secrets.secret_key_base).first
      @current_user_id = jwt_payload['id']
      return
    end

    if request.headers['Authorization'].present?
      jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.secrets.secret_key_base).first
      @current_user_id = jwt_payload['id']
    end
  end

  def authenticate_api_v1_user!(options = {})
    head :unauthorized unless signed_in?
  end

  def current_api_v1_user
    @current_api_v1_user ||= super || User.find(@current_user_id)
  end

  def signed_in?
    @current_user_id.present?
  end
end
