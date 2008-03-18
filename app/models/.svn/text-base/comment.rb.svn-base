class Comment < ActiveRecord::Base
  
  belongs_to :episode
  
  # we don't care if people leave their emails, but we have to have a name so people can reply to eachother.
  validates_presence_of :author
  validates_presence_of :comment
  
end
