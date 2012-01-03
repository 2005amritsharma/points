class CreateTxns < ActiveRecord::Migration
  def self.up
    create_table :txns do |t|
      t.datetime :txn_date
      t.integer :activity_id
      t.integer :points
      t.string :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :txns
  end
end
