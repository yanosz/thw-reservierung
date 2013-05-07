class AddToToRental < ActiveRecord::Migration
  def self.up
    add_column :rentals, :to, :DateTime
  end

  def self.down
    remove_column :rentals, :to
  end
end
