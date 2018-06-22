class Origin < ActiveRecord::Base

  belongs_to :destination

  has_many :trip_estimates
  has_many :users, through: :trip_estimates

end
