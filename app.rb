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
	erb :visit
end
