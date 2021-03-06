class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types :error, :success

  before_filter :authenticate_user

  private

  def authenticate_user
    unless signed_in?
      redirect_to new_session_path, error: "First log in to use the web site"
    end
  end

  def signed_in?
    @current_user = User.find_by id: session[:user_id]
    !(@current_user.nil? || @current_user.session.nil?)
  end
end
