class AddUserToRental < ActiveRecord::Migration
  def self.up
    add_column :rentals, :user, :string
  end

  def self.down
    remove_column :rentals, :user
  end
end
