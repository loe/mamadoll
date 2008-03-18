class Appearance < ActiveRecord::Base
  
  belongs_to :episode
  belongs_to :person
  
  # associations aren't very useful without both sides!
  validates_presence_of :episode_id
  validates_presence_of :person_id
  
end
