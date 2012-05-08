class CreatePollPlayerAnswers < ActiveRecord::Migration
  def self.up
    create_table :poll_player_answers do |t|
      t.references :user
      t.references :poll_question
      
    end
  end

  def self.down
    drop_table :poll_player_answers
  end
end
