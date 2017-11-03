require 'sinatra/base'

# pull in the helpers and controllers
Dir.glob('./app/{helpers,controllers,models}/*.rb').each { |file| require file }

# map the controllers to routes
use ContactsController
use GroupsController
use LoginController
run ApplicationController
