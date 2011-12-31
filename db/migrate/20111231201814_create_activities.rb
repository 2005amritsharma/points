class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.string :title
      t.string :description
      t.integer :points
      t.integer :activity_type

      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
