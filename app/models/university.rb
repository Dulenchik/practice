class University < ActiveRecord::Base
  has_many :faculties

  validates :name, :presence => true,
                   :length => { :maximum => 45 }
  validates :address, :presence => true, 
                      :length => { :maximum => 45 }
end
