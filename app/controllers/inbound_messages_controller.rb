class InboundMessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    render :nothing => true, :status => 200
  end
end