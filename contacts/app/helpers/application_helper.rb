require 'haml'

module ApplicationHelper

  def logged_in?
    session[:user_id].present?
  end

  def current_user
    return unless logged_in?
    @current_user ||= User.find(session[:user_id])
  end

  # Is this useful?
  # def cached_css(stylesheet)
  #   css_file = File.join(ApplicationController.settings.root, 'public', 'css', "#{stylesheet}.css")
  #   expire_time = File.mtime(css_file).to_i
  #   "<link href='/css/#{stylesheet}.css?#{expire_time}' rel='stylesheet'>"
  # end

  def flash_message_clear
    session[:flash_message] = nil
    session[:flash_message_type] = nil
  end

  def flash_success(msg)
    session[:flash_message] = msg
    session[:flash_message_type] = 'flash-message-success'
  end

  def flash_fail(msg)
    session[:flash_message] = msg
    session[:flash_message_type] = 'flash-message-fail'
  end

end
