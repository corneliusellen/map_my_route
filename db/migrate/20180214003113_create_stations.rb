class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :fuel_type
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.string :hours_operation
    end
  end
end
