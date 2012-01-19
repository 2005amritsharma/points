class Activity < ActiveRecord::Base
  default_scope :order => "title"

  has_many :actions

end
