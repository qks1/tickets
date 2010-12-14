class Ticket < ActiveRecord::Base   

  has_and_belongs_to_many :stations
  belongs_to :train_date_place
  belongs_to :plane_date_place
  belongs_to :bus_date_place
  belongs_to :user
end
