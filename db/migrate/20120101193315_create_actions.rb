class CreateActions < ActiveRecord::Migration
  def self.up
    create_table :actions do |t|
      t.datetime :action_date
      t.integer :activity_id
      t.integer :points
      t.string :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :actions
  end
end
