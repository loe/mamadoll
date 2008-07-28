class Page < ActiveRecord::Base
  
  has_permalink :title
  
  validates_presence_of :title
  validates_presence_of :body
  
  def to_param
    permalink
  end
  
end
