class AddTypeToSubject < ActiveRecord::Migration
  def self.up
    add_column :subjects, :type, :string
  end

  def self.down
    remove_column :subjects, :type
  end
end
