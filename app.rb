# frozen_string_literal: true

require 'sinatra'
require 'json'
require 'httparty'

require_relative 'automation.rb'

before do

end

after do
  response.body = JSON.dump(response.body)
end

post '/tickets' do
  push = JSON.parse(request.body.read)
  puts "I got some JSON: #{push.inspect}"
end

get '/' do
  { 'message': 'Hello world!' }
end

post '/events' do
  #Automation.new('create', message: 'Ola').trigger
  request_body = JSON.parse(request.body.read)
  ticket_data = request_body["data"]
  HTTParty.post("https://tech-dojo-ruby-bridge.herokuapp.com/tickets", :body => ticket_data)
end
