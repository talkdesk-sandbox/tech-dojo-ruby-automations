# frozen_string_literal: true

require 'sinatra'
require 'json'

require_relative 'automations.rb'

before do
  content_type :json
end

after do
  response.body = JSON.dump(response.body)
end

get '/' do
  { 'message': 'Hello world!' }
end

# TODO by dojos
# post '/events' do
#   Automation.new('create', message: 'Ola').trigger
# end
