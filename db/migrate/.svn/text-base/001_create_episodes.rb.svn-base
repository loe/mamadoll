class CreateEpisodes < ActiveRecord::Migration
  def self.up
    create_table :episodes do |t|
      t.column "title", :string
      t.column "banner", :string
      t.column "body", :text
    end
  end

  def self.down
    drop_table :episodes
  end
end
