class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :micropost

  validates :text, :length => { :maximum => 45 }

  validates :user_id, :presence => true
  validates :micropost_id, :presence => true
end
