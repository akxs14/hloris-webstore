require 'rubygems'
require 'sinatra'
require 'slim'
require 'pony'

configure do
  set :public_folder, 'public'
end

def configure_pony
  Pony.options = {
    :via => :smtp,
    :via_options => {
    :address => 'mail.gandi.net',
    :port => '587',
    :user_name => 'contact@hloris.com',
    :password => 'PMH-7613akxs14',
    :authentication => :plain,
    :enable_starttls_auto => true,
    :domain => 'hloris.com'
    }
  }
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

post '/contact_us_en' do
  configure_pony
  name = params[:name]
  sender_email = params[:email]
  message = params[:message]

  begin
    Pony.mail(
      :from => "#{name}<#{sender_email}>",
      :to => 'angelos@hloris.com',
      :subject =>"#{name} has contacted you",
      :body => "#{message}",
    )
    redirect '/en'
  rescue
    puts "boom!!!!!"
    @exception = $!
    puts @exception
  end
  redirect '/en'
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
