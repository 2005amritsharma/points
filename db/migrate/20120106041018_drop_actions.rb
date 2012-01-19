class DropActions < ActiveRecord::Migration
  def self.up
     drop_table :actions
  end

  def self.down
  end
end
