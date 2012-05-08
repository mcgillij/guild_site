class ForumTopic < ActiveRecord::Base
  validates_presence_of :title, :message => "Hey FUCKO put a title!"
  belongs_to :forum_post
  has_many :users
end
