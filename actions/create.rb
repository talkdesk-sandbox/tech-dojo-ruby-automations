# frozen_string_literal: true

require 'rest-client'
require 'json'

class CreateAction
  attr_reader :http_path

  def initialize(options)
    @http_path = 'https://tech-dojo-ruby-bridge.herokuapp.com/tickets'
    @data = options.fetch(:data)
  end

  def execute
    RestClient.post(
      @http_path,
      @data.to_json,
      content_type: :json, accept: :json
    )
  end
end
