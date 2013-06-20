class Group < ActiveRecord::Base
  belongs_to :chair
  has_many :users

  validates :name, :length => { :maximum => 45 }
  validates :chair_id, :presence => true
end
