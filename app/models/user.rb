class User < ActiveRecord::Base

  has_many :trip_estimates

  has_many :origins, through: :trip_estimates
  has_many :destinations, through: :trip_estimates


end
