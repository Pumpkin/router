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
      when 'blog.getcloud.me'
        redirect "http://blog.getcloudapp.com#{path}", 301
      when 'developer.getcloud.me'
        redirect "http://developer.getcloudapp.com#{path}", 301
      when 'help.getcloud.me'
        redirect "http://support.getcloudapp.com", 301
      when 'support.getcloud.me'
        redirect "http://help.getcloudapp.com#{path}", 301
      else
        redirect 'http://getcloudapp.com', 301
    end
  end
  
  # Start the server if the ruby file is executed directly
  run! if app_file == $0
end
