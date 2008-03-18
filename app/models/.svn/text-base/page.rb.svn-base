class Page < ActiveRecord::Base
  
  # for friendly urls
  has_friendly_id :title, :use_slug => true 
  
  # gives us nice urls  
  validates_presence_of :title
  validates_presence_of :body
  
end
