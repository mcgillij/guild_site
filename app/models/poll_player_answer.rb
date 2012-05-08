class PollPlayerAnswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :poll_question
end
