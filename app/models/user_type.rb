class UserType < ActiveRecord::Base
  has_many :users

  validates :name, :presence => true,
                   :length => { :maximum => 45 }
end
