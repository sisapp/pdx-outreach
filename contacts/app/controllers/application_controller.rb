require "sinatra/activerecord"
require 'sinatra/base'
require 'haml'

# application_controller.rb
class ApplicationController < Sinatra::Base
  helpers ApplicationHelper

  # set folder for templates to ../views, but make the path absolute
  set :views, File.expand_path('../../views', __FILE__)

  # don't enable logging when running tests
  configure :production, :development do
    enable :logging
  end

  get '/' do
    current_user ? 'curr user' : 'no user'
  end

  get '/login' do
    haml :'login/login'
  end

  post '/login' do
    puts params.inspect
  end

  get '/signup' do
    haml :'login/signup'
  end
  post '/signup' do
    puts params.inspect
  end
end
