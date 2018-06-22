class Destination < ActiveRecord::Base

  belongs_to :origin

  has_many :trip_estimates
  has_many :users, through: :trip_estimates

end
