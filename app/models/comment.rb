class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :micropost

  validates :text, :presence => true, 
                   :length => { :maximum => 45 }
  validates :user_id, :presence => true,
                      :numericality => { :only_integer => true }
  validates :micropost_id, :presence => true,
                           :numericality => { :only_integer => true }
end
