require 'spec_helper'

describe "Editing a User Account" do
  let(:user) { create(:user) }

  it "requires login" do
    visit "/account"
    current_path.should == "/sign_in"
  end

  context "when logged in" do
    before do
      sign_in_user_with(user.account_email, user.password)
      visit "/account"
    end

    describe "the show page" do
      describe "account attributes" do
        it "displays errors" do
          fill_in "Account email", :with => ""
          click_on "Update User"

          page.should have_content "can't be blank"
        end

        it "allows updating values" do
          fill_in "Account email",         :with => "new_one@aol.com"
          fill_in "Password",              :with => "password"
          fill_in "Password confirmation", :with => "password"
          click_on "Update User"

          current_path.should == "/account"
          find_field('Account email').value.should == "new_one@aol.com"
        end
      end
    end
  end
end
