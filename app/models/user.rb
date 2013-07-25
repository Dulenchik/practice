class User < ActiveRecord::Base
  belongs_to :group
  belongs_to :user_type
  has_many :microposts
  has_many :user_sessions
  has_many :ratings
  has_many :comments
  has_and_belongs_to_many :chairs

  has_secure_password

  validates :name, :presence => true,
                   :length => { :maximum => 45 }
  validates :email, :presence => true, 
                    :length => { :maximum => 45 }, 
                    :uniqueness => true
  validates :password, :confirmation => true, on: :create
  validates :group_id, :presence => true, 
                       :numericality => { :only_integer => true }
  validates :user_type_id, :presence => true, 
                           :numericality => { :only_integer => true }
end
