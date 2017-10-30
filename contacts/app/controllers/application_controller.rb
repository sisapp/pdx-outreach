require 'sinatra/base'

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
    'Hello world!'
  end
end
