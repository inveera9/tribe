class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :fname, :mname, :lname) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :fname, :mname, :lname,:current_password) }
  	end

  	def invite_user
  	@user = User.invite!(:email => params[:user][:email], :name => params[:user][:name])
  	render :json => @user

	end
end
