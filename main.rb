require 'rubygems'
require 'sinatra/base'

class Router < Sinatra::Base

  configure :production do
    require 'newrelic_rpm'
  end

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
        redirect "https://github.com/cloudapp/api/blob/master/README.md", 301
      when 'developer.getcloudapp.com'
        redirect "https://github.com/cloudapp/api/blob/master/README.md", 301
      when 'help.getcloud.me'
        redirect "http://support.getcloudapp.com#{path}", 301
      when 'help.getcloudapp.com'
        redirect "http://support.getcloudapp.com#{path}", 301
      when 'sparkler.getcloudapp.com'
        redirect "http://releases.getcloudapp.com/osx/sparkle/stable.xml", 301
      when 'start.getcloudapp.com'
        redirect "http://support.getcloudapp.com/customer/portal/articles/208713-getting-started", 301
      else
        redirect 'http://getcloudapp.com', 301
    end
  end

  # Start the server if the ruby file is executed directly
  run! if app_file == $0
end
