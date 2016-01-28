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
	amount = 0
	summ = 0
	orders.each do |i|
		i[0] = Product.find(i[0])
		i << i[0].price * i[1].to_i 
		amount += i[1].to_i
		summ += i[2]
	end
	total = {:amount=>amount, :summ=>summ}
	return orders, total
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

get '/cart' do
	erb "Stub"
end

get '/order' do
	@o = Order.last
	@orders, @total = parse_orders @o.order_list
	erb :order_done
end

post '/cart' do
	@list = params[:orders]
	@orders, @total = parse_orders @list
	erb :cart
end

post '/order' do
	o = Order.new params[:order]
	o.save
	@o = Order.last
	@orders, @total = parse_orders @o.order_list
	erb :order_done
	#redirect '/order'
end