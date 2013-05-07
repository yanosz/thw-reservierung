require 'net/ldap'

#Helper module for ldap-access
#Purposes: 1st: Wrapping ruby-ldap for convinient acess, 2nd: take care of reading / applying settings
class LdapConnection
  #Connect to ldap with given credentials (or used cached connection)
  def initialize(user = nil, password = nil)
    user ||= ldap_config['bind_user']
    password ||= ldap_config['bind_password']
    puts "Binding as #{user}:#{password}"
    @ldap = Net::LDAP.new :host => ldap_config['server'],
      :port => (ldap_config['port'] || '389').to_i,
      :auth => {
            :method => :simple,
            :username => user,
            :password => password
      }
      @ldap.bind
  end



#Find ldap-object by userPrincipalName
  def ldap_find_by_fk_attribute(search_str)
    filter = Net::LDAP::Filter.eq( ldap_config["fk_attribute"], ldap_short2fk("#{search_str}") )
    treebase = ldap_config['base_dn']
    return (@ldap.search( :base => treebase, :filter => filter ) || []).first
  end
  def check
    @ldap.get_operation_result.code
  end


  def ldap_short2fk(short)
    short + (ldap_config["fk_suffix"] || '').gsub(/@/,'@') if short 
  end
  def ldap_fk2short(fk)
    fk.gsub(ldap_config["fk_suffix"],'') if fk 
  end
  def ldap_fk_attribute_name
    ldap_config["fk_attribute"]
  end
  
  #parse ldap config (or used cached version)
  def ldap_config
    @@ldap_config ||= YAML::load_file("#{RAILS_ROOT}/config/ldap.yml")[RAILS_ENV || 'development']
  end
  
end