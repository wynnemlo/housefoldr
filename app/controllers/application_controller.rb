class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :user_signed_in?

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    !!current_user
  end

  def require_user
    if !user_signed_in?
      flash["danger"] = "You do not have the permissions to do that."
      redirect_to sign_in_path
    end
  end
end
