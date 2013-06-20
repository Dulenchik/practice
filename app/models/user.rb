class User < ActiveRecord::Base
  belongs_to :group
  belongs_to :user_type
  has_many :microposts
  has_many :user_session_timetables
  has_many :ratings
  has_many :comments
  has_many :microposts :through => :ratings
  has_many :microposts :through => :comments
  has_and_belongs_to_many :chairs

  validates :name, :length => { :maximum => 45 }
  validates :email, :length => { :maximum => 45 }
  validates :encrypted_password, :length => { :maximum => 45 }

  validates :group_id, :presence => true
  validates :user_type_id, :presence => true
end
