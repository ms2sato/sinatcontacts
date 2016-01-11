require 'sinatra'
require 'sinatra/reloader'

get '/' do
    @now = Time.now
    erb :index
end

get '/contact_new' do
    erb :contact_form
end

post '/contacts' do
    @name = params[:name]
    confirmed = params[:confirmed]
    if confirmed
        puts "確認済み"
        # ここでデータを保存するといい感じになります。また次回。
        redirect '/'
    else
        puts "確認前"
        erb :contact_confirm
    end    
end
