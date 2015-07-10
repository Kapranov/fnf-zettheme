class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :set_locale

  def set_locale
    if cookies[:FnfZettheme_locale] && I18n.available_locales.include?(cookies[:FnfZettheme_locale].to_sym)
      l = cookies[:FnfZettheme_locale].to_sym
    else
      begin
        country_code = request.location.country_code
        if country_code
          country_code = country_code.downcase.to_sym
          [:ru, :ua, :by].include?(country_code) ? l = :uk : l = :en
        else
          l = I18n.default_locale
        end
      rescue
        l = I18n.default_locale
      ensure
        cookies.permanent[:FnfZettheme_locale] = l
      end
    end
    I18n.locale = l
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(
      :name,
      :current_password,
      :avatar,
      :avatar_cache_id,
      :remove_avatar
    ) }
  end

  def after_sign_in_path_for(resource)
    # landing_index_path(current_user)
    dashboards_index_path
  end

end
