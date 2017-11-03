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

  # don't enable logging when running tests
  configure :production, :development do
    enable :logging
  end
  enable :sessions

  before do
    unless(logged_in? || PUBLIC_ROUTES.include?(request.path_info))
      flash_fail('Please login to proceed.')
      redirect '/login'
    end
  end

  get '/' do
    cached_css('base-min')
    @page_title = 'Home'
    haml :index
  end

end
