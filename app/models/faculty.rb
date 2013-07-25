class Faculty < ActiveRecord::Base
  belongs_to :university
  has_many :chairs

  validates :name, :presence => true,
                   :length => { :maximum => 45 }
  validates :university_id, :presence => true,
                            :numericality => { :only_integer => true }
end
