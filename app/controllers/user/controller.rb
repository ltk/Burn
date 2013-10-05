class User::Controller < ApplicationController

  private

  def authorized?
    user_logged_in?
  end
end