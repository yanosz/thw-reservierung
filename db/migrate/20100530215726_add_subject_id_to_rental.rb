class AddSubjectIdToRental < ActiveRecord::Migration
  def self.up
    add_column :rentals, :subject_id, :integer
  end

  def self.down
    remove_column :rentals, :subject_id
  end
end
