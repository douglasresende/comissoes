class ApplicationController < ActionController::Base
  protect_from_forgery
  # http_basic_authenticate_with :name => "user", :password => "pass", :except => [:index, :show]
  # http_basic_authenticate_with :name => "user", :password => "pass", :only => :destroy
  
  before_filter :set_locale
  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { :locale => I18n.locale }
  end
end
