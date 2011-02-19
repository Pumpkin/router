require 'rubygems'
require 'sinatra/base'

class Router < Sinatra::Base

  set :root, File.dirname(__FILE__)
  
  get '/*/?' do
    domain = request.host
    path = request.fullpath

    case domain
      when 'blog.getcloudapp.com'
        redirect "http://blog.getcloud.me#{path}"
      else
        redirect 'http://getcloud.me'
    end
  end
  
  # Start the server if the ruby file is executed directly
  run! if app_file == $0
end
