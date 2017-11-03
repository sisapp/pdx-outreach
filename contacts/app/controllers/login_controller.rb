class LoginController < ApplicationController

  before do
    @page_title = 'Login'
  end

  get '/login' do
    haml :'login/login'
  end

  post '/login' do
    u = params['user']
    user = User.find_by(email: u['email'])
    if(user && user.authenticate(u['password']))
      flash_success('Login successful!')
      session[:user_id] = user.id
      redirect '/'
    else
      flash_fail('Invalid login credentials.')
      redirect '/login'
    end
  end

  get '/logout' do
    @current_user = session[:user_id] = nil
    redirect '/'
  end
end
