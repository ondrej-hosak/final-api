$: << 'lib'
require 'bundler/setup'

require 'final-api/app'

FinalAPI.setup
FinalAPI::App.run!
