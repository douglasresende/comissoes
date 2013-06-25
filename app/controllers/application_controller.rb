class ApplicationController < ActionController::Base
  protect_from_forgery
  # http_basic_authenticate_with :name => "user", :password => "pass", :except => [:index, :show]
  # http_basic_authenticate_with :name => "user", :password => "pass", :only => :destroy
end
