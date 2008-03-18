class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.column "episode_id", :integer, :limit => 50, :default => 0, :null => false
      t.column "author", :string
      t.column "email", :string
      t.column "comment", :text
    end
  end

  def self.down
    drop_table :comments
  end
end
