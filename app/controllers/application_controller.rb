class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def access_denied
    redirect_to root_path, :alert => exception.message
  end

  def set_admin_locale
    I18n.locale = :es
  end
end
