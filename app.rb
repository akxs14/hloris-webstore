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
  redirect '/en', :layout => :'layout_en'
end

get '/products' do
  redirect '/en/products', :layout => :'layout_en'
end

get '/about_us' do
  redirect '/en/about_us', :layout => :'layout_en'
end

get '/contact_us' do
  redirect '/en/contact_us', :layout => :'layout_en'
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
  slim :index_en, :layout => :'layout_en'
end

get '/en/products' do
  slim :products_en, :layout => :'layout_en'
end

get '/en/about_us' do
  slim :about_us_en, :layout => :'layout_en'
end

get '/en/contact_us' do
  slim :contact_us_en, :layout => :'layout_en'
end

get '/en/contact_failure' do
  slim :contact_failure_en, :layout => :'layout_en'
end

get '/en/contact_success' do
  slim :contact_success_en, :layout => :'layout_en'
end

# Greek section
get '/el' do
  slim :index_el, :layout => :'layout_el'
end

get '/el/products' do
  slim :products_el, :layout => :'layout_el'
end

get '/el/about_us' do
  slim :about_us_el, :layout => :'layout_el'
end

get '/el/contact_us' do
  slim :contact_us_el, :layout => :'layout_el'
end

get '/el/contact_failure' do
  slim :contact_failure_el, :layout => :'layout_el'
end

get '/el/contact_success' do
  slim :contact_success_el, :layout => :'layout_el'
end

post '/contact_us_el' do
  configure_pony
  name = params[:name]
  sender_email = params[:email]
  message = params[:message]
  check = params[:InputReal]

  redirect '/el/contact_failure' if check != '7'

  begin
    Pony.mail(
      :from => "#{name}<#{sender_email}>",
      :to => 'angelos@hloris.com',
      :subject =>"#{name} has contacted you",
      :body => "#{message}",
    )
    redirect '/el'
  rescue
    @exception = $!
    puts @exception
  end
  redirect '/el/contact_success'
end


# German section
get '/de' do
  slim :index_de, :layout => :'layout_de'
end

get '/de/products' do
  slim :products_de, :layout => :'layout_de'
end

get '/de/about_us' do
  slim :about_us_de, :layout => :'layout_de'
end

get '/de/contact_us' do
  slim :contact_us_de, :layout => :'layout_de'
end

get '/de/contact_failure' do
  slim :contact_failure_de, :layout => :'layout_de'
end

get '/de/contact_success' do
  slim :contact_success_de, :layout => :'layout_de'
end

post '/contact_us_de' do
  configure_pony
  name = params[:name]
  sender_email = params[:email]
  message = params[:message]
  check = params[:InputReal]

  redirect '/de/contact_failure' if check != '7'

  begin
    Pony.mail(
      :from => "#{name}<#{sender_email}>",
      :to => 'angelos@hloris.com',
      :subject =>"#{name} has contacted you",
      :body => "#{message}",
    )
    redirect '/de'
  rescue
    @exception = $!
    puts @exception
  end
  redirect '/de/contact_success'
end
