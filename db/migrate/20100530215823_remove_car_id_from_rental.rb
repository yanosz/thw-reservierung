class RemoveCarIdFromRental < ActiveRecord::Migration
  def self.up
    remove_column :rentals, :car_id
  end

  def self.down
    add_column :rentals, :car_id, :integer
  end
end
