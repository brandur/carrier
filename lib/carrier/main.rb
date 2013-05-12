module Carrier
  Main = Rack::Builder.new do
    use Rack::Instruments, context: { app: "carrier" }
    use Rack::SSL if Config.production?
    use Rack::Deflater

    run Sinatra::Router.new {
      mount API
      run   Default # index + error handlers
    }
  end
end
