class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :micropost

  validates :value, :presence => true,
                    :numericality => { :only_integer => true }
  validates :user_id, :presence => true,
                      :numericality => { :only_integer => true }
  validates :micropost_id, :presence => true,
                           :numericality => { :only_integer => true }
end
