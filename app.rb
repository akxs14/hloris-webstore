require 'rubygems'
require 'sinatra'
require 'slim'


configure do
  set :public_folder, 'public'
end

get '/' do
  slim :index
end

get '/products' do
  slim :products
end

get '/about_us' do
  slim :about_us
end

get '/contact_us' do
  slim :contact_us
end
