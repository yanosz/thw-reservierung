class AddFromdateToRental < ActiveRecord::Migration
  def self.up
    add_column :rentals, :from_date, :DateTime
  end

  def self.down
    remove_column :rentals, :from_date
  end
end
