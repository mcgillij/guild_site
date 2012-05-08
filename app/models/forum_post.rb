class ForumPost < ActiveRecord::Base
  validates_presence_of :body, :message => "Hey FUCKO put a title!"
  has_many :forum_topics
  belongs_to :user
end
