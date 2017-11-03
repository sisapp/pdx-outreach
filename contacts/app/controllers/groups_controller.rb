class GroupsController < ApplicationController

  before do
    @page_title = 'Groups'
  end

  get '/groups' do
    @page_subtitle = 'Group list'
    # TODO: scope this to @current_user
    @groups = Group.order(:name)
    haml :'groups/index'
  end

  get '/groups/new' do
    @page_subtitle = 'New group'
    haml :'groups/new'
  end

  post '/groups/new' do
    Group.create(params[:group])
    redirect '/groups'
  end

  get '/group/:id/delete' do
    flash_success('Group successfully deleted')
    Group.destroy(params[:id])
    redirect '/groups'
  end

end
