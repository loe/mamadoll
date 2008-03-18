class Person < ActiveRecord::Base

  # for friendly urls
  has_friendly_id :name, :use_slug => true 

  has_many :appearances, :dependent => :destroy
  has_many :episodes, :through => :appearances, :uniq => true
  
  validates_presence_of :name
  validates_presence_of :image_url
  validates_presence_of :image_height
  validates_presence_of :image_width
  validates_presence_of :profile
  
  def appears_in?(episode)
    unless episode == nil
      if appearance = Appearance.find(:first, :conditions => "episode_id = " + episode.id.to_s + " AND person_id = " + self.id.to_s)
        appearance
      end
    end
  end
  
end
