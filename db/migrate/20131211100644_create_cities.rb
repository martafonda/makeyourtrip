class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.date :arrival
      t.date :departure
      t.text :comment
      t.timestamps
    end
  end
end
