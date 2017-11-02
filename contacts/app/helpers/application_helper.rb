module ApplicationHelper
  def logged_in?
    session[:user_id].present?
  end

  def current_user
    return unless logged_in?
    @current_user ||= User.find(session[:user_id])
  end
end
