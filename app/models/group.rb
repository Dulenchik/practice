class Group < ActiveRecord::Base
  belongs_to :chair
  has_many :users

  validates :name, :presence => true,
                   :length => { :maximum => 45 }
  validates :chair_id, :presence => true, 
                       :numericality => { :only_integer => true }
end
