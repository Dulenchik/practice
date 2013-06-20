class UserType < ActiveRecord::Base
  has_many :users

  validates :name, :length => { :maximum => 45 }
end
