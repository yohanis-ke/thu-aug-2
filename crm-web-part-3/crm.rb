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
   # @contact = Contact.all
  # params[:id] contains the id from the URL
  @user_search = Contact.find_by(id: params[:id].to_i)
  erb :show_contact
  # @contact.each do |list|
  #   if list.id==search_id
  #     @user_search=list
  #   end
  #   erb :show_contact
  # end
puts "NoMethodError at /contacts/mittens
undefined method `first_name' for nil:NilClass"

end

after do
  ActiveRecord::Base.connection.close
end
