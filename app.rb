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
  # TODO: validate fields to check if data exists
  data = JSON.parse(request.body.string)['data']
  Automation.new('create', data).trigger
end
