class User 
  attr_accessor :role_symbols
  attr_accessor :name
  
  def self.authenticate(short,password)
    unless(defined? SKIP_LDAP_FOR_DEV && SKIP_LDAP_FOR_DEV)
      search_connection = LdapConnection.new #1st - find dn
      entry = search_connection.ldap_find_by_fk_attribute(short) #Load data from database
      entry_dn = entry.try(:dn)
      puts "Entry-dn is #{entry_dn}"
      return nil unless entry_dn #No entry-dn
      connection = LdapConnection.new(entry_dn,password) #3rd step - use dn for bind
      code = connection.check
      return nil unless code == 0 #User not found / username, password wrong
    end
    user = User.new #2nd step build user object
    user.role_symbols = entry.fuehrung.map {|p| p.to_sym} if entry.respond_to? :fuehrung
    user.name = short #Set name
    
    
    return user #Return user
  end
end
