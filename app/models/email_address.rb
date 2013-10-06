class EmailAddress < ActiveRecord::Base
  validates :user, :address, :presence => true

  belongs_to :user

  scope :verified, -> { where(verified: true) }

  def status
    verified ? :verified : :unverified
  end
end
