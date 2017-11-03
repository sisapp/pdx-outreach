class ContactsController < ApplicationController

  before do
    @page_title = 'Contacts'
  end

  get '/contacts' do
    @page_subtitle = 'Contact list'
    # TODO: scope this to @current_user
    @contacts = Contact.order(:name)
    haml :'contacts/index'
  end

  get '/contacts/new' do
    @groups = Group.select(:id, :name).order(:name)
    @page_subtitle = 'New contact'
    haml :'contacts/new'
  end

  post '/contacts/new' do
    c = Contact.create(params[:contact])
    c.group_ids = params['groups']
    flash_success('Contact successfully saved')
    redirect '/contacts'
  end

  get '/contact/:id/delete' do
    flash_success('Contact successfully deleted')
    Contact.destroy(params[:id])
    redirect '/contacts'
  end

end
