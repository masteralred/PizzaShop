require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:./db/pizzashop.db"

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
end

def parse_orders orders
	orders = orders.split(",").map {|e| e.split("=")}
	orders.map! {|e| e = [(e[0].split("_")[1]), e[1]]}
	return orders
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
	orders = params[:orders]
	@orders = parse_orders orders
	amount = 0
	summ = 0
	@orders.each do |i|
		i[0] = Product.find(i[0])
		i << i[0].price * i[1].to_i 
		amount = amount + i[1].to_i
		summ = summ + i[0].price
	end
	@total = {:amount=>amount, :summ=>summ} 
	erb :cart
end

post '/order' do
	o = Order.new params[:zakaz]
	o.order_list = $txt
	o.save
	o = Order.last
	erb "<h2>ORDER №#{o.id}</h2> <p><b>ИМЯ:</b> #{o.name}</p><p><b>ТЕЛЕФОН:</b> #{o.phone}</p><p><b>АДРЕС:</b> #{o.adress}</p> #{$txt}"
end