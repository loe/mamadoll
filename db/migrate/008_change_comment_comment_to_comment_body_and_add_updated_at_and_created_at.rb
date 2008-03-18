class ChangeCommentCommentToCommentBodyAndAddUpdatedAtAndCreatedAt < ActiveRecord::Migration
  def self.up
    rename_column "comments", "comment", "body"
    add_column "comments", "created_at", :datetime
    add_column "comments", "updated_at", :datetime
  end

  def self.down
    rename_column "comments", "body", "comment"
    remove_column "comments", "created_at", :datetime
    remove_column "comments", "updated_at", :datetime
  end
end
