# frozen_string_literal: true

require 'rest-client'
require 'json'

class CreateAction
  attr_reader :http_path

  def initialize(options)
    @http_path = 'localhost:9092'
    puts options
    @data = options.fetch(:data)["data"]
  end

  def execute
    RestClient.post(
      @http_path,
      @data.to_json,
      content_type: :json, accept: :json
    )
  end
end
