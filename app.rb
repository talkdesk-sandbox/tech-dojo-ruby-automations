# frozen_string_literal: true

require 'sinatra'
require 'json'

require_relative 'automation.rb'

before do
  content_type :json
end

after do
  response.body = JSON.dump(response.body)
end

get '/' do
  { 'message': 'Hello world!' }
end

post '/events' do
  Automation.new('create', message: 'Ola').trigger
end
