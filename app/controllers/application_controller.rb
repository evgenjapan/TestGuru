class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  skip_before_action :verify_authenticity_token, if: -> { controller_name == 'sessions' && action_name == 'create' }

  before_action :authenticate_user!

  before_action :set_locale

  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    { lang: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name])
  end

  def after_sign_in_path_for(resource)
    flash[:notice] = "Hello, #{current_user.username}!"
    if current_user.admin?
      admin_tests_path
    else
      super
    end
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

end
