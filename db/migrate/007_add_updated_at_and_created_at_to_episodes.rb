class AddUpdatedAtAndCreatedAtToEpisodes < ActiveRecord::Migration
  def self.up
    add_column "episodes", "created_at", :datetime
    add_column "episodes", "updated_at", :datetime
  end

  def self.down
    remove_column "episodes", "created_at"
    remove_column "episodes", "updated_at"
  end
end
