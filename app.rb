#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

# main page
get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"
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

	@title = "Thank you!"
	@message = "Dear #{@user_name}, we'll be waiting for you at #{@date_time}."

	f = File.open './public/user.txt', 'a'
	f.write "User: #{@user_name}, Phone: #{@phone}, Date and Time: #{@date_time}."
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
	f.write "User: #{@user_email}, Text: #{@user_text}."
	f.close

	erb :message
end
