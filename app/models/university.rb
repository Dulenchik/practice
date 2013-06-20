class University < ActiveRecord::Base
  has_many :faculties
  validates :name, :length => { :maximum => 45 }
  validates :address, :length => { :maximum => 45 }
end
