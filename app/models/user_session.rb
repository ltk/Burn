class UserSession
  include SimplestAuth::Session
  authentication_identifier :account_email
end
