class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    super
  end

  def authenticate_user!
    user = super
    unless cookies[:dist_session_id] and (dist_session = DistSession.find_by(:session_id => cookies[:dist_session_id])) and
        JSON.parse(dist_session.data, :symbolize_names => true)[:user_id] == user.id
      sign_out
      throw :warden, :scope => :user
    end
  end
end
