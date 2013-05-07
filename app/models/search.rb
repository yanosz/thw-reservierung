class Search
  attr_accessor :show_history
  attr_accessor :order
  def order_key
    Search.search_option(@order) || :from_date
  end
  
  #Static search-data für rentals
  @@search_data = {"Bezeichnung" => :subject_id, "Für" => :user, "Beginn" => :from_date, "Ende" => :to_date}
  def self.search_keys
    @@search_data.keys
  end
  def self.search_option(key)
    @@search_data[key]
  end
end