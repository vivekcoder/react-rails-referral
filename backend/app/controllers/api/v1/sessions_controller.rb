class Api::V1::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token

  include DeviseRegisterable
  # before_action :configure_permitted_parameters
  # POST /resource
  def create
    user = User.find_by(email: params[:email])

    if user && user.valid_password?(params[:password])
      render json: render_user(user).merge!(referred_mails(user)), status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

end