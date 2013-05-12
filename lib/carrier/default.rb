module Carrier
  class Default < Sinatra::Base
    include Logging

    configure do
      set :views, "#{Config.root}/views"
    end

    error do
      e = env["sinatra.error"]
      log_exception(e)
      slim :"errors/500"
    end

    before do
      @cookie = Cookie.new(session)
    end

    get "/" do
      if @cookie.access_token
        redirect to(Config.dashboard_url)
      else
        redirect to("/login")
      end
    end

    not_found do
      slim :"errors/404"
    end
  end
end
