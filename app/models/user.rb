class User < ActiveRecord::Base
  include SimplestAuth::Model::ActiveRecord

  authenticate_by :account_email

  attr_accessor :password, :password_confirmation

  validates :account_email,
            :uniqueness => true,
            :presence   => true,
            :email      => true
  validates :password,
            :password_confirmation,
            :presence => true,
            :unless   => :persisted?
  validates :password, :confirmation => true

  has_many :burners
  has_many :email_addresses
end
