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

get '/details/:id' do
	id = params[:id]
	@var = Product.find(id)
	erb :details
end

post '/cart' do
	@orderlist = Hash.new
	list = params[:list]
	list = list.split(",").map { |e| e.split("=") }
	amount = 0
	summ = 0
	list.each do |i|
		p = Product.find(i[0].last) 
		(@orderlist[p.title]||=[]) << p.price
		@orderlist[p.title] << i[1].to_i
		@orderlist[p.title] << (p.price * i[1].to_i)
		@orderlist[p.title] << p.small_image_path
		amount = amount + i[1].to_i
		summ = summ + p.price
	end
	@total = {:amount=>amount, :summ=>summ}
	erb :cart
end

post '/order'
	erb "ORDER"
end