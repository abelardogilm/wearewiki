require 'sinatra'
require "sinatra/basic_auth"
require 'sinatra/activerecord'
require './config/environments'
require 'pry'

Dir['./models/*.rb'].each { |file| require file }

# Specify your authorization logic
authorize "Public" do |username, password|
  User.password_matches?(username, password)
end

protect "Public" do
  get '/' do
    'Has entrao coleguita de la veguita'
  end
end

