require "sinatra/activerecord"
require 'sinatra/base'
require 'haml'

# application_controller.rb
class ApplicationController < Sinatra::Base
  PUBLIC_ROUTES = ['/', '/login']

  helpers ApplicationHelper
  # set folder for templates to ../views, but make the path absolute
  set :views, File.expand_path('../../views', __FILE__)
  set :root, File.expand_path('../../..', __FILE__)
  set :server, :puma

  # TODO: configure logging
  # configure :production, :development do
  #   enable :logging
  # end
  enable :sessions

  before do
    dev_mode = (ApplicationController.environment == :development)
    unless(logged_in? || PUBLIC_ROUTES.include?(request.path_info) || dev_mode)
      flash_fail('Please login to proceed.')
      redirect '/login'
    end
  end

  get '/' do
    @page_title = 'Home'
    haml :index
  end

end
