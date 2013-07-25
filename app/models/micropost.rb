class Micropost < ActiveRecord::Base
  belongs_to :user
  has_many :ratings
  has_many :comments

  validates :content, :presence => true,
                      :length => { :maximum => 45 }
  validates :user_id, :presence => true,
                      :numericality => { :only_integer => true }
end
