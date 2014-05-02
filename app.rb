require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'
Dir['./models/*.rb'].each { |file| require file }

get '/' do
  'Ola k ase'
end
