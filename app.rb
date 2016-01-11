# Gemを読み込む準備
require 'rubygems'
require 'bundler' 
# Gemfileに入っているgemを全部require
Bundler.require 

set :database, {adapter: "sqlite3", database: "contacts.sqlite3"}

class Contact < ActiveRecord::Base
  validates_presence_of :name
end

get '/' do
    @now = Time.now
    @contacts = Contact.all
    erb :index
end

get '/contact_new' do
    @contact = Contact.new
    erb :contact_form
end

post '/contacts' do
    @name = params[:name]
    confirmed = params[:confirmed]
    if confirmed
        puts "確認済み"
        Contact.create!(name: @name)
        redirect '/'
    else
        puts "確認前"
        @contact = Contact.new(name: @name)
        if @contact.valid?
            erb :contact_confirm
        else    
            erb :contact_form
        end    
    end    
end
