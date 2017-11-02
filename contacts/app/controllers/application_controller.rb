require "sinatra/activerecord"
require 'sinatra/base'
require 'haml'

# application_controller.rb
class ApplicationController < Sinatra::Base
  helpers ApplicationHelper

  # set folder for templates to ../views, but make the path absolute
  set :views, File.expand_path('../../views', __FILE__)
  set :root, File.expand_path('../../..', __FILE__)

  # don't enable logging when running tests
  configure :production, :development do
    enable :logging
  end
  enable :sessions

  get '/' do
    haml :index
  end

end
