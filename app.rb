require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:./db/pizzashop.db"

class Product < ActiveRecord::Base
end

get '/' do
	@products = Product.all
  	erb :index
end

get '/about' do
  	erb :about
end

get '/something' do
	@var = Product.find('1')
  	erb :something
end