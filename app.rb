require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified here."
end
