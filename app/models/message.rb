class Message < ActiveRecord::Base
    
    scope :actual, -> { where("expires_at > CURRENT_TIMESTAMP") }
    
end
