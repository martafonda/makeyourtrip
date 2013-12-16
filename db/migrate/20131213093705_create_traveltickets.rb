class CreateTraveltickets < ActiveRecord::Migration
  def change
    create_table :traveltickets do |t|
      t.string :origin
      t.string :destination
      t.string :type
      t.datetime :departure
      t.string :place
      t.references  :city, index: true

      t.timestamps
    end
  end
end
