class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  helper_method def favorite
    @favorite ||= (_session_favorite || _create_favorite)
  end

  private

  def _session_favorite
    return unless session[:favorite_id]
    @current_favorite ||= Favorite.find(session[:favorite_id])
  end

  def _create_favorite
    return if session[:favorite_id]
    current_favorite = Favorite.create!
    session[:favorite_id] = current_favorite.id
    current_favorite
  end

end
