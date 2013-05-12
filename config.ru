$stdout.sync = $stderr.sync = true

require "bundler/setup"
Bundler.require

require "./lib/carrier"

Slim::Engine.set_default_options pretty: !Carrier::Config.production?

run Carrier::Main
