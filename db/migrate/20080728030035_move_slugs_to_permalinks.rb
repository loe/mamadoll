class MoveSlugsToPermalinks < ActiveRecord::Migration
  def self.up
    
    Episode.find(:all).each do |ep|
      ep.save!
    end
    
    Person.find(:all).each do |pr|
      pr.save!
    end
    
    Page.find(:all).each do |pg|
      pg.save!
    end
  end

  def self.down
  end
end
