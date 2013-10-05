require 'spec_helper'

describe User do
  it { should validate_presence_of(:account_email) }
  it { should validate_confirmation_of(:password) }

  it { should allow_value("asdf@aol.com").for(:account_email) }
  it { should_not allow_value("asdf@aol").for(:account_email) }
  it { should_not allow_value("asdf@").for(:account_email) }
  it { should_not allow_value("asdf").for(:account_email) }

  it "validates uniqueness of account email" do
    create(:user)
    should validate_uniqueness_of :account_email
  end
end
