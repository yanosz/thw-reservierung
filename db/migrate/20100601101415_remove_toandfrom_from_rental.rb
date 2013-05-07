class RemoveToandfromFromRental < ActiveRecord::Migration
  def self.up
    remove_column :rentals, :from
    remove_column :rentals, :to
  end

  def self.down
    add_column :rentals, :to, :DateTime
    add_column :rentals, :from, :DateTime
  end
end
