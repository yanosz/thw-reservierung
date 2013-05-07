class AddFromToRental < ActiveRecord::Migration
  def self.up
    add_column :rentals, :from, :DateTime
  end

  def self.down
    remove_column :rentals, :from
  end
end
