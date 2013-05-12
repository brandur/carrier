module Carrier
  class API < Sinatra::Base
    include Logging

    before do
      auth = Rack::Auth::Basic::Request.new(request.env)
      halt(401) if !auth.provided? || !auth.basic? ||
        auth.credentials[1] != Config.cloudmailin_api_key
    end

    error 400 do
      MultiJson.encode(error: "Invalid input parameters.")
    end

    error 401 do
      MultiJson.encode(error: "Invalid authorization credentials.")
    end

    post "/messages" do
      raw = MultiJson.decode(request.body.read) rescue halt(400)
      log(:new_message, raw)
    end
  end
end
