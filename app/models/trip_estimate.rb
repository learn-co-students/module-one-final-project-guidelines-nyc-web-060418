class TripEstimate < ActiveRecord::Base

  belongs_to :user
  belongs_to :origin
  belongs_to :destination

end
