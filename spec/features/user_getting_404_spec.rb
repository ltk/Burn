require "spec_helper"

describe "a user visiting a non-existing page" do
  describe "because URL is unrecognized" do
    it "sees the 404 page" do
      visit "/foo"
      page.should have_content("The page you were looking for doesn't exist")
    end
  end
end
