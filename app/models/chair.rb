class Chair < ActiveRecord::Base
  belongs_to :faculty
  has_many :groups
  has_and_belongs_to_many :users

  validates :name, :length => { :maximum => 45 }
  validates :faculty_id, :presence => true
end
