class DropSessions < ActiveRecord::Migration
  def self.up
    drop_table :sessions
  end

  def self.down
    create_table "sessions", :force => true do |t|
      t.string   "session_id"
      t.text     "data"
      t.datetime "updated_at"
    end
    
  end
end
