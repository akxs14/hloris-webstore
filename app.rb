require 'rubygems'
require 'sinatra'
require 'slim'


configure do
  set :public_folder, 'public'
end

# Redirect to english pages for all default routes
get '/' do
  redirect '/en'
end

get '/products' do
  redirect '/en/products'
end

get '/about_us' do
  redirect '/en/about_us'
end

get '/contact_us' do
  redirect '/en/contact_us'
end

# English section
get '/en' do
  slim :index_en
end

get '/en/products' do
  slim :products_en
end

get '/en/about_us' do
  slim :about_us_en
end

get '/en/contact_us' do
  slim :contact_us_en
end
