# frozen_string_literal: true

require 'rest-client'
require 'json'

class CreateAction
  attr_reader :http_path

  def initialize(options)
    @http_path = 'https://run.mocky.io/v3/0ec25a7a-3eba-4249-9eae-e32cba5923a7'
    @data = options.fetch(:data)
  end

  def execute
    RestClient.post @http_path, @data.to_json, content_type: :json, accept: :json
  end
end
