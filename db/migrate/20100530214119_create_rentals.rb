class CreateRentals < ActiveRecord::Migration
  def self.up
    create_table :rentals do |t|
      t.DateTime :from
      t.DateTime :to
      t.integer :car_id
      t.text :comment
      t.string :type
      t.timestamps
    end
  end

  def self.down
    drop_table :rentals
  end
end
