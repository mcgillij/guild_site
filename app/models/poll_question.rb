class PollQuestion < ActiveRecord::Base
  has_many :poll_questions
  belongs_to :user
end
