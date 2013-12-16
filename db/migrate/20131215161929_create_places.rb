class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :description
      t.string :address
      t.datetime :datetime
      t.references  :city, index: true
      t.timestamps
    end
  end
end
