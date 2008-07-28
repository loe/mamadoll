class Appearance < ActiveRecord::Base
  
  belongs_to :episode
  belongs_to :person

  validates_presence_of :episode, :person
  
end
