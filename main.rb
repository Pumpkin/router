require 'rubygems'
require 'sinatra/base'

class Router < Sinatra::Base

  set :root, File.dirname(__FILE__)
  
  get '/*/?' do
    domain = request.host

    case domain
      when 'blog.getcloudapp.com'
        redirect 'blog.getcloud.me'
      else
        'This is something else'
    end
  end
  
  # Start the server if the ruby file is executed directly
  run! if app_file == $0
end
