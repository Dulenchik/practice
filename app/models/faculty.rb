class Faculty < ActiveRecord::Base
  belongs_to :university
  has_many :chairs

  validates :name, :length => { :maximum => 45 }
  validates :university_id, :presence => true
end
