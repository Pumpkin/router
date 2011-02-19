require 'rubygems'
require 'sinatra/base'

class Router < Sinatra::Base

  set :root, File.dirname(__FILE__)
  
  before do
    response.headers['Cache-Control'] = 'public, max-age=31557600'
  end

  get '/*/?' do
    domain = request.host
    path = request.fullpath

    case domain
      when 'blog.getcloudapp.com'
        redirect "http://blog.getcloud.me#{path}", 301
      else
        redirect 'http://getcloud.me', 301
    end
  end
  
  # Start the server if the ruby file is executed directly
  run! if app_file == $0
end
