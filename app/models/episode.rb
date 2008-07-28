class Episode < ActiveRecord::Base

  has_many :appearances, :dependent => :destroy
  has_many :people, :order => "name", :through => :appearances, :uniq => true
  has_many :comments
  
  has_permalink :title
  
  validates_presence_of :title
  validates_presence_of :body
  
  def to_param
    permalink
  end
  
end
