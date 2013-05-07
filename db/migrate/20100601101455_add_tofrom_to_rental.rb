class AddTofromToRental < ActiveRecord::Migration
  def self.up
    add_column :rentals, :to_date, :DateTime
    add_column :rentals, :from, :DateTime
  end

  def self.down
    remove_column :rentals, :from
    remove_column :rentals, :to_date
  end
end
