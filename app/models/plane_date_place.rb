class PlaneDatePlace < ActiveRecord::Base

  belongs_to :route_date
  has_one :ticket
end
