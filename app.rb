require 'sinatra'
require 'json'

before do
  content_type :json
end

after do
  response.body = JSON.dump(response.body)
end

get '/' do
  { 'message': 'Hello world!' }
end
