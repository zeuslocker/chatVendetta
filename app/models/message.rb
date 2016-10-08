class Message < ActiveRecord::Base
   # self.primary_key = 'crptid'
   after_create do
      
   end
   has_one :messagelink
    scope :actual, -> { where("expires_at > CURRENT_TIMESTAMP") }
   
   def to_param
    "#{link}"
   end
 
  
end
