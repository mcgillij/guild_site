class Post < ActiveRecord::Base
  named_scope :public, :conditions => {:public_flag => true }
  validates_presence_of :title, :body
#  validates_acceptance_of(:public_flag, :message => "Needs to not be null ", :accept => "1", :allow_nil => false)
  belongs_to :user
  has_many :comments
  
end
