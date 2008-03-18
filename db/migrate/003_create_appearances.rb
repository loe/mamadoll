class CreateAppearances < ActiveRecord::Migration
  def self.up
    create_table :appearances do |t|
      t.column "person_id",  :integer, :limit => 50, :default => 0, :null => false
      t.column "episode_id", :integer, :limit => 50, :default => 0, :null => false
    end
  end

  def self.down
    drop_table :appearances
  end
end
