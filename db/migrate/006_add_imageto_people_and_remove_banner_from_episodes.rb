class AddImagetoPeopleAndRemoveBannerFromEpisodes < ActiveRecord::Migration
  def self.up
     remove_column "episodes", "banner"
     add_column "people", "image_url", :string
     add_column "people", "image_height", :integer
     add_column "people", "image_width", :integer
  end

  def self.down
    add_column "episodes", "banner", :string
    remove_column "people", "image_url"
    remove_column "people", "image_height"
    remove_column "people", "image_width"
  end
end
