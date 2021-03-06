class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def search
    # @users = User.where("username LIKE ?", "%" + params[:search] + "%")
    # render 'users/index'
    @songs = Song.search(params[:search])
    render 'songs/index'
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:account_update) << :username
    # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
    # devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

end
