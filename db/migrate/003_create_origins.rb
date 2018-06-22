class CreateOrigins < ActiveRecord::Migration[5.1]

  def change
    create_table :origins do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
    end
  end
end
