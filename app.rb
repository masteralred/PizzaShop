require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:./db/pizzashop.db"

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
	validates :name, presence: true
	validates :phone, presence: true
	validates :adress, presence: true
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
	$txt = ""
	list.each do |i|
		p = Product.find(i[0].last)
		$txt = $txt + "<p><b>Продукт: #{p.title}</b></p>" 
		(@orderlist[p.title]=[]) << p.price
		$txt = $txt + "<p>Цена: #{p.price}</p>"
		@orderlist[p.title] << i[1].to_i
		$txt = $txt + "<p>Количество: #{i[1]}</p>"
		@orderlist[p.title] << (p.price * i[1].to_i)
		$txt = $txt + "</p>Всего: #{p.price * i[1].to_i}</p>"
		@orderlist[p.title] << p.small_image_path
		amount = amount + i[1].to_i
		summ = summ + p.price
	end
	@total = {:amount=>amount, :summ=>summ}
	$txt = $txt + "<p><b>Общее количество: #{amount} &nbsp;&nbsp; | &nbsp;&nbsp; Общая сумма: #{summ}</b></p>" 
	erb :cart
end

post '/order' do
	o = Order.new params[:zakaz]
	o.order_list = $txt
	o.save
	o = Order.last
	erb "<h2>ORDER №#{o.id}</h2> <p><b>ИМЯ:</b> #{o.name}</p><p><b>ТЕЛЕФОН:</b> #{o.phone}</p><p><b>АДРЕС:</b> #{o.adress}</p> #{$txt}"
end