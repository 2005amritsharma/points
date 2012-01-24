class Txn < ActiveRecord::Base
  default_scope :order => "id"
  belongs_to :activity

  def self.total_points txn_date
    # Txn.sum(:points, :conditions => ["txn_date >= ? AND txn_date < ?", txn_date, (txn_date + 1.days)])

    positive_count = Txn.sum(:points,
                             :conditions=> ["txn_date >= ? AND txn_date < ?", txn_date, (txn_date + 1.days)],
                             :joins=> " INNER JOIN activities ON activities.id = txns.activity_id AND activities.activity_type = 1")

    negative_count = Txn.sum(:points,
                             :conditions=> ["txn_date >= ? AND txn_date < ?", txn_date, (txn_date + 1.days)],
                             :joins=> " INNER JOIN activities ON activities.id = txns.activity_id AND activities.activity_type = 2")

    positive_count - negative_count
  end

  def self.cumulative_points

    positive_count = Txn.sum(:points,
                             :joins=> " INNER JOIN activities ON activities.id = txns.activity_id AND activities.activity_type = 1")

    negative_count = Txn.sum(:points,
                             :joins=> " INNER JOIN activities ON activities.id = txns.activity_id AND activities.activity_type = 2")

    positive_count - negative_count
  end

  def self.history txn_date
    Txn.all(:conditions=> ["txn_date >= ? AND txn_date < ?", txn_date, (txn_date + 1.days)],
            :joins=> " INNER JOIN activities ON activities.id = txns.activity_id")
  end
end
