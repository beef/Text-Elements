class TextElement < ActiveRecord::Base
  acts_as_textiled :value
  
  validates_presence_of :var
  
  #get with the variable as the called method
  def self.method_missing(method, *args)
    method_name = method.to_s
    uri = args[0].to_s
    super(method, *args)
    
  rescue NoMethodError
    #retrieve a value
    te = object(method_name, uri)
    "<div class=\"ugc\">#{te.value || dummy_text}</div>"
  end
  
  #retrieve the actual Setting record
  def self.object(var_name, uri)
    TextElement.find_or_create_by_var(:var => var_name.to_s, :uri => uri)
  end
  
  def self.dummy_text(method_name)
    "<p>You can edit this text in the CMS under text elements, it is called '#{method_name.titleize}'</p>"
  end
end
