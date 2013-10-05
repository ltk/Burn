require 'spec_helper'

describe "User Sessions" do

  describe "Logging in" do
    it "rejects invalid user accounts" do
      sign_in_user_with('user@example.com', 'password')

      current_path.should == '/sign_in'
      page.should have_content('User not found for supplied credentials')
    end

    it "redirects a valid user to the account page" do
      sign_in_user

      current_path.should == '/account'
      page.should have_content('You have signed in successfully')
    end
  end

  describe "Accessing the account page" do
    it "rejects non-logged-in users" do
      visit '/account'

      current_path.should == '/sign_in'
      page.should have_content('Login')
    end
  end

  describe "Logging out" do
    it "logs out the current user" do
      sign_in_user
      click_link 'Log Out'

      current_path.should == '/sign_in'
      page.should have_content('You have signed out')
    end
  end

end
