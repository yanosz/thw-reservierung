class Subject < ActiveRecord::Base
  has_many :rentals
  validates_uniqueness_of :kennzeichen, :message => "Das Kennzeichen muss eindeutig sein."
  validates_presence_of :name, :message => "Ein Name muss angegeben werden"
  def to_s
    "#{kennzeichen} (#{name})"
  end
end
