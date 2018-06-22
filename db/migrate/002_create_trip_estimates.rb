class CreateTripEstimates < ActiveRecord::Migration[5.1]

  def change
    create_table :trip_estimates do |t|
      t.references :user
      t.references :origin
      t.references :destination
      t.integer :estimated_cost_cents_max
      t.integer :primetime_percentage
    end
  end

end
