class InboundMessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :login_required, :only => [:show]
  before_action :load_message,   :only => [:show]

  # ToDo: setup auth token for webhook URL

  def create
    inbound_messages.each(&:save)
    render :nothing => true, :status => 200
  end

  private

  def load_message
    @inbound_message = current_user.inbound_messages.find(params[:id])
  end

  def mandrill_events
    JSON.parse(params[:mandrill_events]) || []
  end

  def inbound_mandrill_events
    mandrill_events.select do |event|
      event[:event] == 'inbound'
    end
  end

  def inbound_messages
    @inbound_messages ||= inbound_mandrill_events.map do |event|
      InboundMessage.from_mandrill_event(event)
    end
  end
end