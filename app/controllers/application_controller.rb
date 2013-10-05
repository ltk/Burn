class ApplicationController < ActionController::Base
  include SimplestAuth::Controller
  track_authenticated :user

  protect_from_forgery with: :exception

  unless Rails.env.development?
    rescue_from ActiveRecord::RecordNotFound, ActionView::MissingTemplate,
      :with => :render_404
  end

  def render_404
    render :file => Rails.root.join('public', '404.html'), :status => 404
  end

  def redirect_logged_in_user
    redirect_to account_url if user_logged_in?
  end

  def login_url
    sign_in_url
  end
end
