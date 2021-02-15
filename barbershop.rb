require 'sinatra'
get '/' do
	erb :index
end
get '/admin' do
    erb :admin
end
post '/' do
	@user_name = params[:user_name]
	@phone = params[:phone]
	@date_time = params[:date_time]
	
	@title = 'Thank you!'
	@message = "Dear #{@user_name}, we'll be waiting for you at #{@date_time}"

	f = File.open './public/user.txt', 'a'
	f.write "User: #{@user_name}, Phone: #{@phone}, Date: #{@date_time}\n"
	f.close
	erb :message	
end
post '/admin' do 
	@login = params[:login]
	@pass = params[:password]
	
	if @login == "admin" && @pass == "secret"
		@file = File.open("./public/user.txt", "r")
	erb :admin
	else 
	@report = '<p><h1>Access denied</h1></p>'
	erb :index
	end
end

