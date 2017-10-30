module ApplicationHelper
  def login?
    !session[:username].nil?
  end

  def username
    session[:username]
  end
end
