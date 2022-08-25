class ApplicationController < ActionController::API
  include Pundit::Authorization
  include ::ActionController::Cookies

  before_action :authenticate, :check_headers
  around_action :set_locale

  CONTENT_TYPES = [:json, :multipart_form, :url_encoded_form]

  private

  def authenticate
    access_token = cookies.signed[:jwt]
  end

  def check_headers
    unless CONTENT_TYPES.include?(Mime::Type.lookup(request.content_type)&.symbol)
      render json: { errors: [I18n.t("errors.application.mime_type")] }, status: :not_acceptable
    end
  end

  def get_bearer_token(headers)
    headers["Authorization"]&.split("Bearer ")&.last
  end

  def current_user
  end

  def set_locale(&action)
    locale = params[:locale] || params[:lang]
    locale = I18n.locale_available?(locale) ? locale : I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end
