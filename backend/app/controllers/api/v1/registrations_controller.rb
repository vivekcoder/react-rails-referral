class Api::V1::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token
  include DeviseRegisterable
  # before_action :configure_permitted_parameters
  # POST /resource
  def create
    user = User.new(configure_permitted_parameters)
    if user.save
      render json: render_user(user), status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def configure_permitted_parameters
    params.require(:registration).permit(:email, :password, :password_confirmation)
  end
end