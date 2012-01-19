class Txn < ActiveRecord::Base
 
  belongs_to :activity

  def self.total_points txn_date
    Txn.sum(:points, :conditions  => { :txn_date  => txn_date })
  end

end
