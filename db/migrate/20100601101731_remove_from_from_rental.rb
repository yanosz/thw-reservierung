class RemoveFromFromRental < ActiveRecord::Migration
  def self.up
    remove_column :rentals, :from
  end

  def self.down
    add_column :rentals, :from, :DateTime
  end
end
