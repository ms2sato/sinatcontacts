# Gemを読み込む準備
require 'rubygems'
require 'bundler' 
# Gemfileに入っているgemを全部require
Bundler.require 

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
