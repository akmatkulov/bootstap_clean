#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

# main page
get '/' do
	erb "Welcome to Barber Shop!"
end


# about
get '/about' do
	erb :about
end

# visit
get '/visit' do
	erb :visit
end

post '/visit' do
	@user_name = params[:user_name]
	@phone = params[:phone_number]
	@date_time = params[:date_time]
	@barber = params[:barber]
	@color = params[:user_color]

	hh = { :user_name => "Введите имя",
				 :phone_number => "Введите номер телефона",
			 	 :date_time => "Введите дату и время" }

	hh.each do |key, value|
		if params[key] == ''
			# переменной @error присвоить value из хеша hh
			# (а value из хеша hh это сообщение об ошибке)
			# т.е. переменной @error присвоить сообщение об ошибке
			@error = hh[key]
			# вернуть представление visit
			return erb :visit
		end 
	end

	@title = "Thank you!"
	@message = "Dear #{@user_name}, we'll be waiting for you at #{@date_time}. #{@color}."

	f = File.open './public/user.txt', 'a'
	f.write "User: #{@user_name}, Phone: #{@phone}, Date and Time: #{@date_time} Your barber: #{@barber} Your color: #{@color}.\n"
	f.close

	erb :message
end

# get Contacts
get '/contacts' do
	erb :contacts
end

post '/contacts' do
	@user_email = params[:user_email]
	@user_text = params[:user_text]

	@title = "Thank you!"
	@message = "Dear #{@user_email} Your message has been sent."

	f = File.open './public/contacts.txt', 'a'
	f.write "User: #{@user_email}, Text: #{@user_text}.\n"
	f.close

	erb :message
end
