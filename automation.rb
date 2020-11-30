# frozen_string_literal: true

require_relative 'actions/create.rb'

class Automation
  EVENT_TO_ACTION = {
    create: CreateAction
  }.freeze

  def initialize(event, data)
    @event = event
    @action = EVENT_TO_ACTION[event.to_sym].new data: data
    @data = data
  end

  def trigger
    @action.execute
  end
end
