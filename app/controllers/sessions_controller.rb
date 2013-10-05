class SessionsController < ApplicationController
  include SimplestAuth::SessionsController

  set_session_class_name 'UserSession'
  persist_authenticated :user

  before_action :redirect_logged_in_user, :only => [:new]

  def create
    sign_user_in_or_render(:url => account_url)
  end

  def destroy
    sign_user_out(:url => sign_in_url)
  end
end
