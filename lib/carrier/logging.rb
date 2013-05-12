module Carrier
  module Logging
    def log(action, data={})
      data.merge!(app: "carrier", id: request.env["REQUEST_IDS"])
      Slides.log(data, data)
    end

    def log_exception(e, data={})
      #Airbrake.notify(e) if Config.airbrake_api_key
      Slides.log(:exception,
        class: e.class.name, message: e.message,
        id: request.env["REQUEST_IDS"], backtrace: e.backtrace.inspect)
    end
  end
end
