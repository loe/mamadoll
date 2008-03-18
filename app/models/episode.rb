class Episode < ActiveRecord::Base

  # for pretty urls
  has_friendly_id :title, :use_slug => true 

  has_many :appearances, :dependent => :destroy
  has_many :people, :order => "name", :through => :appearances, :uniq => true
  has_many :comments
  
  validates_presence_of :title
  validates_presence_of :body
  
end
