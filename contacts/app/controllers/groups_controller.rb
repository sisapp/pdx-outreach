class GroupsController < ApplicationController

  get '/groups' do
    @page_title = 'Groups'
    # TODO: scope this to @current_user
    @groups = Group.order(:name)
    haml :'groups/index'
  end
end
