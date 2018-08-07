require_relative 'contact'
require 'sinatra'

get '/home' do
  @index = 'index'
  erb :index
end

get '/' do
  erb :index
end

get '/about' do
  @about = 'About'
  erb :about
end

get '/contacts' do
  @contact = Contact.all
  erb :contacts
end

get '/contacts/:id' do
  # params[:id] contains the id from the URL
  @contact = Contact.find_by(params[:id])
  erb :show_contact
end

after do
  ActiveRecord::Base.connection.close
end
