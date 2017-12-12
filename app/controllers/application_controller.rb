class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action do
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_locale
    { locale: I18n.locale }
  end


end
