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
  check = params[:InputReal]

  redirect '/en/contact_failure' if check != '7'

  begin
    Pony.mail(
      :from => "#{name}<#{sender_email}>",
      :to => 'angelos@hloris.com',
      :subject =>"#{name} has contacted you",
      :body => "#{message}",
    )
    redirect '/en'
  rescue
    @exception = $!
    puts @exception
  end
  redirect '/en/contact_success'
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

get '/en/contact_failure' do
  slim :contact_failure_en
end

get '/en/contact_success' do
  slim :contact_success_en
end

# Greek section
get '/el' do
  slim :index_el
end

get '/el/products' do
  slim :products_el
end

get '/el/about_us' do
  slim :about_us_el
end

get '/el/contact_us' do
  slim :contact_us_el
end

get '/el/contact_failure' do
  slim :contact_failure_el
end

get '/el/contact_success' do
  slim :contact_success_el
end

# German section
get '/de' do
  slim :index_de
end

get '/de/products' do
  slim :products_de
end

get '/de/about_us' do
  slim :about_us_de
end

get '/de/contact_us' do
  slim :contact_us_de
end

get '/de/contact_failure' do
  slim :contact_failure_de
end

get '/de/contact_success' do
  slim :contact_success_de
end
