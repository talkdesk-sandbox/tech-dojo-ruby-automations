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
  data = JSON.load(request.body.string)["data"] # TODO validate fields to check if data exists
  Automation.new('create', data).trigger
end
