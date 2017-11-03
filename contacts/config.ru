# pull in the helpers and controllers
#Dir.glob('./app/{helpers,controllers,models}/*.rb').each { |file| require file }
require_relative './app/controllers/application_controller'
# map the controllers to routes
run ApplicationController
use ContactsController
use GroupsController
use LoginController

