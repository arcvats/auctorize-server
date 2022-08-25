class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:login, :signup, :init_admin]

  def init_admin
  end

  def signup
    email = permitted_params[:email]
    password = permitted_params[:password]
    confirm_password = permitted_params[:confirm_password]
    render json: { errors: [I18n.t("errors.session.password_unmatched")] }, status: :bad_request and return if password != confirm_password

    User.create!(email: email, password_digest: password)
  end

  def login
    email = permitted_params[:email]
    password = permitted_params[:password]

    if email.present? && password.present?
      user = User.find_by(email: email)
      
      render json: { errors: [I18n.t("errors.session.email_incorrect")] }, status: :not_found and return if user.blank?
      if user.authenticate(password)
        token = Auth::Core.issue({ user_id: user.uid })
        render json: { errors: [I18n.t("errors.session.token_blank")] }, status: :bad_request and return if token.blank?
        cookies.signed[:jwt] = { value: token, httponly: true }
        render json: { message: "Success" }, status: :ok
      else
        render json: { errors: [I18n.t("errors.session.password_incorrect")] }, status: :unauthorized
      end
    else
      render json: { errors: [I18n.t("errors.session.fields_blank")] }, status: :bad_request
    end
  end

  def logout

  end

  private

  def permitted_params
    params.permit(:email, :password, :confirm_password)
  end
end
