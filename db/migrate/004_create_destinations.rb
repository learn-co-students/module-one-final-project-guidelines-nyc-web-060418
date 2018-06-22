class CreateDestinations < ActiveRecord::Migration[5.1]

  def change
    create_table :destinations do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
    end
  end
end
