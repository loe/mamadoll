class SwitchToPermalinkFu < ActiveRecord::Migration
  def self.up
    add_column :episodes, :permalink, :string
    add_column :pages, :permalink, :string
    add_column :people, :permalink, :string
    add_index :episodes, :permalink
    add_index :pages, :permalink
    add_index :people, :permalink
  end

  def self.down
    remove_index :people, :permalink
    remove_index :pages, :permalink
    remove_index :episodes, :permalink
    remove_column :people, :permalink
    remove_column :pages, :permalink
    remove_column :episodes, :permalink
  end
end
