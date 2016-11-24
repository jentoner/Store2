# class that Controls the Application
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
