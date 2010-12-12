class Client < ActiveRecord::Base
	validates_length_of :patronic, :within => 3..40
  validates_length_of :name, :within => 2..40
	validates_length_of :surname, :within => 2..40
	
	belongs_to :user, :dependent => :destroy

end
