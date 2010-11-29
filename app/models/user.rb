class User < ActiveRecord::Base
  validates_length_of :username, :within => 3..40
  validates_length_of :password, :within => 5..40
  validates_presence_of :username, :email, :password
  validates_uniqueness_of :username, :email
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"

	def self.authenticate(login, pass)
		find_by_username_and_password(login, pass)
	end

end
