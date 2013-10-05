require 'spec_helper'

describe "Creating a User Account" do

  context "on the new account page" do
    before do
      visit "/account/new"
    end

    describe "with valid attributes" do
      before do
        fill_in "Account email", :with => "email@address.com"
        fill_in "Password", :with => "password"
        fill_in "Password confirmation", :with => "password"

        click_on "Create User"
      end

      it "displays the account page and has a success message" do
        page.should have_content "success"
        current_path.should == "/account"
      end

      it "allows signing in with new account" do
        sign_out_user
        sign_in_user_with("email@address.com", "password")

        current_path.should == "/account"
      end
    end

    describe "with invalid attributes" do
      let(:error_messages) do
        {
          "Email Address" => "can't be blank",
          "Password" => "can't be blank",
          "Confirm Password" => "can't be blank"
        }
      end

      before do
        click_on "Create User"
      end

      it "shows the error message" do
        error_messages.each do |field, message|
          page.should have_content message
        end
      end
    end
  end
end
