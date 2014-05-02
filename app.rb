require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'
Dir['./models/*.rb'].each { |file| require file }
require './authorization'

helpers do
  include Sinatra::Authorization
end

get '/' do
  require_login
  'Has entrao coleguita de la veguita'
end

