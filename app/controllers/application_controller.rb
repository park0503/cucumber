    class ApplicationController < ActionController::Base
        before_action :configure_permitted_parameters, if: :devise_controller?
      
        protected
      
        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :sex, :year, :month, :date, :avatar, :address1, :address2, :phone])
          devise_parameter_sanitizer.permit(:account_update, keys: [:name, :sex, :year, :month, :date, :avatar, :address1, :address2, :phone])
        end
      end
