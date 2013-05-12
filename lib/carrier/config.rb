module Carrier
  module Config
    extend self

    def cloudmailin_api_key
      ENV["CLOUDMAILIN_API_KEY"]
    end

    def production?
      ENV["RACK_ENV"] == "production"
    end

    def release
      @release ||= ENV["RELEASE"] || "1"
    end

    def root
      @root ||= File.expand_path("../../../", __FILE__)
    end
  end
end
