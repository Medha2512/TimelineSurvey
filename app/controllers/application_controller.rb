class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protected
  def authenticate_user
    if cookies[:auth_token]
      @current_user ||= User.find_by_auth_token!(cookies[:auth_token])
    return true
    else
      redirect_to(:controller => 'sessions', :action => 'login')
    return false
    end
  end

  def save_login_state
    if cookies[:auth_token]
      begin
        @current_user ||= User.find_by_auth_token!(cookies[:auth_token])
      rescue ActiveRecord::RecordNotFound
        cookies.delete(:auth_token)
        return true
      end
      redirect_to(:controller => 'sessions', :action => @current_user.current_page )
      return false
    else
    return true
    end
  end

  def current_user

    if cookies[:auth_token]
      @current_user ||= User.find_by_auth_token!(cookies[:auth_token])
    end
  end

end
